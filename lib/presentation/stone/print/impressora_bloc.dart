// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_core/domain/dtos/print_params.dart';

import 'package:pos_core/domain/usecases/payment/payment_complete_usecase.dart';
import 'package:pos_core/domain/usecases/print/print_usecase.dart';
import 'package:pos_core/presentation/stone/print/impressora_state.dart';

import 'impressora_event.dart';

class ImpressoraBloc extends Bloc<ImpressoraEvent, ImpressoraState> {
  late StreamSubscription<String> onMessageSubscription;
  final PrintUsecase printUsecase;
  final PaymentCompleteUsecase paymentCompleteUsecase;
  final BuildContext context;

  ImpressoraBloc(
    this.onMessageSubscription,
    this.printUsecase,
    this.paymentCompleteUsecase,
    this.context,
  ) : super(ImpressoraInicial()) {
    on<ImpressaIniciou>(_impressoraIniciou);
    on<ImpressoraFinalizou>(_onImpressoraFinalizou);
    onMessageSubscription = paymentCompleteUsecase.execute(null, "").listen((event) {
      add(ImpressoraFinalizou(result: event));
    });
  }

  FutureOr<void> _impressoraIniciou(
    ImpressaIniciou event,
    Emitter<ImpressoraState> emit,
  ) async {
   await printUsecase.execute(PrintParams(event.filePath, context), event.machineType);
    emit(ImpressoraImprimirEmProgresso());
  }

  FutureOr<void> _onImpressoraFinalizou(
    ImpressoraFinalizou event,
    Emitter<ImpressoraState> emit,
  ) {
    emit(ImpressoraImprimirSucesso());
  }

  @override
  Future<void> close() {
    onMessageSubscription.cancel();
    return super.close();
  }
}
