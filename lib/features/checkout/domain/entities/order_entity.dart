import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class OrderEntity extends HiveObject {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String authorName;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final int quantity;
  OrderEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.authorName,
    required this.price,
    required this.quantity,
  });
}

class OrderEntityAdapter extends TypeAdapter<OrderEntity> {
  @override
  final int typeId = 1;

  @override
  OrderEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderEntity(
      bookId: fields[0] as String,
      image: fields[1] as String,
      title: fields[2] as String,
      authorName: fields[3] as String,
      price: fields[4] as double,
      quantity: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, OrderEntity obj) {
    writer.writeString(obj.bookId);
    writer.writeString(obj.image);
    writer.writeString(obj.title);
    writer.writeString(obj.authorName);
    writer.writeDouble(obj.price);
    writer.writeInt(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}


// i tried to listen to some  cubit state and then call scaffoldMessanger.of(context).showSnackBar() to show a snack bar but ti get this error: