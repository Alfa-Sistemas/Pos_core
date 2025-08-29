import 'package:pos_core/domain/dtos/refund_params.dart';
import 'package:pos_core/domain/repositories/repository.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';

class RefundUsecase extends UsecaseInterface<Future<bool>, RefundParams> {
  final Repository _refundRepository;

  RefundUsecase(this._refundRepository);

  @override
  Future<bool> execute(RefundParams params) async {
    return await _refundRepository.refundSale(
      valor: params.valor,
      permiteEditarValor: params.permiteEditarValor,
      transactionCode: params.transactionCode,
      transactionId: params.transactionId,
    );
  }
}
