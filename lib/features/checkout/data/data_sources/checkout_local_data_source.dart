import 'package:hive/hive.dart';
import 'package:story_squad/core/utils/constants.dart';

import '../../domain/entities/order_entity.dart';

abstract class CheckoutLocalDataSource {
  Future<void> addToCart({required OrderEntity orderEntity});
  Future<void> removeFromCart({required OrderEntity orderEntity});
  List<OrderEntity> getCart();
  Future<void> removeCart();
  Future<void> changeQuantity({required int quantity, required String orderId});
}

class CheckoutLocalDataSourceImpl extends CheckoutLocalDataSource {
  @override
  Future<void> addToCart({required OrderEntity orderEntity}) async {
    final box = Hive.box<OrderEntity>(AppConstants.kCartBox);

    await box.add(orderEntity);
  }

  @override
  Future<void> changeQuantity(
      {required int quantity, required String orderId}) async {
    final box = Hive.box<OrderEntity>(AppConstants.kCartBox);
    final indexes = box.values.indexed;
    final orderIndex = indexes.firstWhere((item) => item.$2.bookId == orderId);
    final orderEntity = OrderEntity(
      bookId: orderIndex.$2.bookId,
      image: orderIndex.$2.image,
      title: orderIndex.$2.title,
      authorName: orderIndex.$2.authorName,
      price: orderIndex.$2.price,
      quantity: quantity,
    );
    await box.putAt(orderIndex.$1, orderEntity);
  }

  @override
  List<OrderEntity> getCart() {
    final box = Hive.box<OrderEntity>(AppConstants.kCartBox);

    return box.values.toList();
  }

  @override
  Future<void> removeCart() async {
    final box = Hive.box<OrderEntity>(AppConstants.kCartBox);
    await box.clear();
  }

  @override
  Future<void> removeFromCart({required OrderEntity orderEntity}) async {
    // final box = Hive.box<OrderEntity>(AppConstants.kCartBox);
    await orderEntity.delete();
  }
}
