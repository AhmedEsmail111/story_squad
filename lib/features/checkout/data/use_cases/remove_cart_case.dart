import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/repos/checkout_repo.dart';

class RemoveCartCase extends UseCase<void, void> {
  final CheckoutRepo checkoutRepo;

  RemoveCartCase({required this.checkoutRepo});
  @override
  Future<Either<Failure, void>> execute([void param]) async {
    return await checkoutRepo.removeCart();
  }
}
