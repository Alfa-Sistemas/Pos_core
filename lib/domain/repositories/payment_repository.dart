import 'package:flutter/widgets.dart';
import 'package:pos_core/domain/entities/payment_entity.dart';
import 'package:pos_core/domain/enums/interest_charging.dart';
import 'package:pos_core/domain/enums/payment_methods.dart';

abstract class PaymentRepository {
  Future<PagamentoEntity> fazerPagamento(
    PaymentMethods formaDePagamento,
    int parcelas,
    int valor,
    BuildContext context, {
    String? deepLinkReturnSchema,
    bool? imprimirComprovanteAutomaticamente,
    InterestCharging? formaDeCobranca,
  });

  

 

  
}