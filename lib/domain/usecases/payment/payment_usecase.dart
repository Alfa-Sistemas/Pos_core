import 'package:pos_core/domain/dtos/payment_params.dart';
import 'package:pos_core/domain/entities/payment_entity.dart';
import 'package:pos_core/domain/enums/interest_charging.dart';
import 'package:pos_core/domain/enums/payment_methods.dart';
import 'package:pos_core/domain/repositories/repository.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';

class MakePaymentUsecase extends UsecaseInterface<Future<PagamentoEntity>, PaymentParams> {
  final Repository _paymentRepository;

  MakePaymentUsecase(this._paymentRepository);

  Future<PagamentoEntity> makePayment(
    PaymentMethods paymentMethod,
    int parcels,
    int ammount, {
    String? deepLinkReturnSchema,
    bool? printAutomaticaly,
    InterestCharging? formaDeCobranca,
  }) async {
    return await _paymentRepository.makePayment(
      paymentMethod,
      parcels,
      ammount,
      deepLinkReturnSchema: deepLinkReturnSchema,
      printAutomaticaly: printAutomaticaly,
      interestCharging: formaDeCobranca,
    );
  }
  
  @override
  Future<PagamentoEntity> execute(PaymentParams params) async {
   return await _paymentRepository.makePayment(
      params.paymentMethods,
      params.parcels,
      params.ammount,
      deepLinkReturnSchema: params.deepLinkReturnSchema,
      printAutomaticaly: params.printAutomaticaly,
      interestCharging: params.interestCharging,
    );
  }
  

  

  

}
