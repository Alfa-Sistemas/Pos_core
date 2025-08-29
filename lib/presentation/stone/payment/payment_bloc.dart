import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_core/domain/usecases/payment/payment_complete_usecase.dart';
import 'package:pos_core/domain/usecases/payment/payment_usecase.dart';
import 'package:pos_core/presentation/stone/payment/payment_event.dart';
import 'package:pos_core/presentation/stone/payment/payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final MakePaymentUsecase paymentUsecase;
  final PaymentCompleteUsecase paymentCompleteUsecase;
  late StreamSubscription<String> _streamSubscription;

  PaymentBloc(this.paymentUsecase, this.paymentCompleteUsecase)
    : super(PagamentoNaoIniciado()) {
    on<PagamentoIniciou>(_onPagamentoIniciou);
    on<PagamentoFinalizou>(_onPagamentoFinalizou);

    _streamSubscription = paymentCompleteUsecase.execute(null).listen((
      event,
    ) {
      add(PagamentoFinalizou(result: event));
    });
  }

  FutureOr<void> _onPagamentoIniciou(
    PagamentoIniciou event,
    Emitter<PaymentState> emit,
  ) {
    try {
      emit(PagamentoEmProgresso());
      paymentUsecase.makePayment(
        event.formaDePagamento,
        event.parcelas,
        event.valor,
        deepLinkReturnSchema: event.deepLinkReturnSchema,
        // printAutomaticaly: event.,
        formaDeCobranca: event.formaDeCobrancaDeJuros,
      );
    } catch (e, s) {
      addError(e, s);
    }
  }

  FutureOr<void> _onPagamentoFinalizou(
    PagamentoFinalizou event,
    Emitter<PaymentState> emit,
  ) {
    try {
      var uri = Uri.parse(event.result);
      log('emitiu pagamento finalizado');
      emit(PagamentoSucesso(resultado: uri.queryParameters));
    } catch (e, s) {
      addError(e, s);
    }
  }

  @override
  Future<void> close() async {
    await _streamSubscription.cancel();
    super.close();
  }
}
