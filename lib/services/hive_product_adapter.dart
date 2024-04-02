import 'package:hive/hive.dart';

class Product {
  String? id;
  String? name;
  String? img;
  double? qtn;
  double? price;
  double? totalPrice;

  Product({this.id, this.name, this.img, this.qtn, this.price, this.totalPrice,});

  Product.fromJson(Map<String, dynamic> json) {
    id = json["product_id"];
    name = json["product_name"];
    img = json["image"];
    qtn = json["quantity"];
    price = json["price"];
    totalPrice = json["total"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["product_id"] = id;
    data["product_name"] = name;
    data["image"] = img;
    data["quantity"] = qtn;
    data["price"] = price;
    data["total"] = totalPrice;
    return data;
  }

}

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final typeId = 0;

  @override
  Product read(BinaryReader reader) {
    final id = reader.readString();
    final name = reader.readString();
    final img = reader.readString();
    final qtn = reader.readDouble();
    final price = reader.readDouble();
    final totalPrice = reader.readDouble();
    return Product(id: id, name: name, img: img, qtn: qtn, totalPrice: totalPrice, price: price);
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer.writeString("${obj.id}");
    writer.writeString("${obj.name}");
    writer.writeString("${obj.img}");
    writer.writeDouble(obj.qtn!);
    writer.writeDouble(obj.price!);
    writer.writeDouble(obj.totalPrice!);
  }

}
