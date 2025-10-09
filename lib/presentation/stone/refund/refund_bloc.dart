import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_core/domain/dtos/refund_params.dart';
import 'package:pos_core/domain/usecases/refund/refund_usecase.dart';

part 'refund_event.dart';
part 'refund_state.dart';

class RefundBloc extends Bloc<RefundEvent, RefundState> {
  final RefundUsecase refundUsecase;
  RefundBloc(this.refundUsecase) : super(EstornoNaoInicilizado()) {
    on<EstornoIniciou>(_onEstornoIniciou);
    on<EstornoFinalizou>(_onEstornoFinalizou);
  }

  late StreamSubscription<String> _streamSubscription;

  FutureOr<void> _onEstornoIniciou(
    EstornoIniciou event,
    Emitter<RefundState> emit,
  ) async {
    emit(EstornoEmProgresso());

    refundUsecase.execute(
      RefundParams(
        event.context,
        event.valor,
        event.permiteEditarValor,
        event.atk,
        event.transactionId,
        event.atk
      ),
        event.machineType
    );
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }

  FutureOr<void> _onEstornoFinalizou(
    EstornoFinalizou event,
    Emitter<RefundState> emit,
  ) async {
    try {
      var uri = Uri.parse(event.result);
      log('emitiu estorno finalizado');
      emit(EstornoSucesso(uri.queryParameters));
    } catch (e, s) {
      addError(e, s);
    }
  }
}
