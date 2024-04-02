import 'dart:convert';

class ProductModel {
  String? id;
  String? name;
  String? image;
  double? price;
  double? totalPrice;
  double? qty;
  List<Modifier>? modifiers;

  ProductModel({
    this.id,
    this.name,
    this.image,
    this.price,
    this.totalPrice,
    this.qty,
    this.modifiers,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    String? image,
    double? price,
    double? totalPrice,
    double? qty,
    List<Modifier>? modifiers,
  }) =>
      ProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        price: price ?? this.price,
        totalPrice: totalPrice ?? this.totalPrice,
        qty: qty ?? this.qty,
        modifiers: modifiers ?? this.modifiers,
      );

  factory ProductModel.fromRawJson(String str) => ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    price: json["price"],
    totalPrice: json["totalPrice"],
    qty: json["qty"],
    modifiers: json["modifiers"] == null ? [] : List<Modifier>.from(json["modifiers"]!.map((x) => Modifier.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "price": price,
    "totalPrice": totalPrice,
    "qty": qty,
    "modifiers": modifiers,
  };
}

class Modifier {
  String? id;
  String? name;
  String? image;
  double? price;
  double? totalPrice;
  double? qty;
  bool? isSelect;

  Modifier({
    this.id,
    this.name,
    this.image,
    this.price,
    this.totalPrice,
    this.qty,
    this.isSelect,
  });

  Modifier copyWith({
    String? id,
    String? name,
    String? image,
    double? price,
    double? totalPrice,
    double? qty,
    bool? isSelect,
  }) =>
      Modifier(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        price: price ?? this.price,
        totalPrice: totalPrice ?? this.totalPrice,
        qty: qty ?? this.qty,
        isSelect: isSelect ?? this.isSelect,
      );

  factory Modifier.fromRawJson(String str) => Modifier.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Modifier.fromJson(Map<String, dynamic> json) => Modifier(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    price: json["price"],
    totalPrice: json["totalPrice"],
    qty: json["qty"],
    isSelect: json["isSelect"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "price": price,
    "totalPrice": totalPrice,
    "qty": qty,
    "isSelect": isSelect,
  };
}
