import 'package:pos_core/domain/repositories/repository.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';

class PaymentCompleteUsecase
    extends UsecaseInterface<Stream<String>, void> {
  final Repository _paymentRepository;

  PaymentCompleteUsecase(this._paymentRepository);

  @override
  Stream<String> execute(void params) {
    return _paymentRepository.paymentComplete;
  }
}
