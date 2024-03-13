import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/repos/checkout_repo.dart';

class ChangeQuantityCase extends UseCase<void, int> {
  final CheckoutRepo checkoutRepo;

  ChangeQuantityCase({required this.checkoutRepo});
  @override
  Future<Either<Failure, void>> execute([int? param, String? orderId]) async {
    return await checkoutRepo.changeQuantity(
        quantity: param!, orderId: orderId!);
  }
}
