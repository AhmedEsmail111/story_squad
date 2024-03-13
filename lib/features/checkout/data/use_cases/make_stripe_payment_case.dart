import 'package:dartz/dartz.dart';
import 'package:story_squad/core/errors/failure.dart';
import 'package:story_squad/core/use_case/use_case.dart';
import 'package:story_squad/features/checkout/domain/repos/checkout_repo.dart';

import '../models/payment_intent_input_model.dart';

class MakeStripePaymentCase extends UseCase<void, PaymentIntentInputModel> {
  final CheckoutRepo checkoutRepo;

  MakeStripePaymentCase({required this.checkoutRepo});
  @override
  Future<Either<Failure, void>> execute(
      [PaymentIntentInputModel? param]) async {
    return await checkoutRepo.makeStripePayment(
        paymentIntentInputModel: param!);
  }
}
