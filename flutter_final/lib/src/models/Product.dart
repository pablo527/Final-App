import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.quantity,
    this.id,
    this.name,
    this.description,
    this.price,
    this.img,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  int quantity;
  String id;
  String name;
  String description;
  int price;
  String img;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        quantity: json["quantity"],
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        img: json["img"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "_id": id,
        "name": name,
        "description": description,
        "price": price,
        "img": img,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
