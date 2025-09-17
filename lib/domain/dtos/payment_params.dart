import 'package:flutter/widgets.dart';
import 'package:pos_core/domain/enums/interest_charging.dart';

class PaymentParams {
  final String paymentMethods;
  final int parcels;
  final int ammount;
  final BuildContext context;
  final String? deepLinkReturnSchema;
  final bool? printAutomaticaly;
  final InterestCharging? interestCharging;

  PaymentParams(
    this.paymentMethods,
    this.parcels,
    this.ammount,
    this.deepLinkReturnSchema,
    this.printAutomaticaly,
    this.interestCharging,
    this.context,
  );
}
