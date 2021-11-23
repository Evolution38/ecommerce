// To parse this JSON data, do
//
//     final newArrivalModel = newArrivalModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

NewArrivalModel newArrivalModelFromJson(String str) =>
    NewArrivalModel.fromJson(json.decode(str));

String newArrivalModelToJson(NewArrivalModel data) =>
    json.encode(data.toJson());

class NewArrivalModel extends Equatable {
  const NewArrivalModel({
    this.result,
  });

  final List<Result>? result;

  factory NewArrivalModel.fromJson(Map<String, dynamic> json) =>
      NewArrivalModel(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [result];
}

class Result extends Equatable {
  const Result({
    this.id,
    this.name,
    this.categoryName,
    this.finalPrice,
    this.actualPrice,
    this.discount,
    this.qty,
    this.description,
    this.images,
    this.variant,
    this.color,
  });

  final String? id;
  final String? name;
  final String? categoryName;
  final String? finalPrice;
  final String? actualPrice;
  final String? discount;
  final String? qty;
  final String? description;
  final List<Image>? images;
  final List<Variant>? variant;
  final List<dynamic>? color;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["ID"],
        name: json["name"],
        categoryName: json["category_name"],
        finalPrice: json["final_price"],
        actualPrice: json["actual_price"],
        discount: json["discount"],
        qty: json["qty"],
        description: json["description"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        variant:
            List<Variant>.from(json["variant"].map((x) => Variant.fromJson(x))),
        color: List<dynamic>.from(json["color"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "name": name,
        "category_name": categoryName,
        "final_price": finalPrice,
        "actual_price": actualPrice,
        "discount": discount,
        "qty": qty,
        "description": description,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "variant": List<dynamic>.from(variant!.map((x) => x.toJson())),
        "color": List<dynamic>.from(color!.map((x) => x)),
      };

  @override
  List<Object?> get props => [
        id,
        name,
        categoryName,
        finalPrice,
        actualPrice,
        discount,
        qty,
        description,
        images,
        variant,
        color
      ];
}

class Image extends Equatable {
  const Image({
    this.imgId,
    this.imgProduct,
  });

  final String? imgId;
  final String? imgProduct;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imgId: json["img_id"],
        imgProduct: json["img_product"],
      );

  Map<String, dynamic> toJson() => {
        "img_id": imgId,
        "img_product": imgProduct,
      };

  @override
  List<Object?> get props => [imgId, imgProduct];
}

class Variant extends Equatable {
  const Variant({
    this.id,
    this.weight,
    this.quantity,
    this.discount,
    this.finalPrice,
    this.actualPrice,
    this.productId,
    this.color,
  });

  final String? id;
  final String? weight;
  final String? quantity;
  final String? discount;
  final String? finalPrice;
  final String? actualPrice;
  final String? productId;
  final List<dynamic>? color;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["ID"],
        weight: json["weight"],
        quantity: json["quantity"],
        discount: json["discount"],
        finalPrice: json["final_price"],
        actualPrice: json["actual_price"],
        productId: json["product_id"],
        color: List<dynamic>.from(json["color"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "weight": weight,
        "quantity": quantity,
        "discount": discount,
        "final_price": finalPrice,
        "actual_price": actualPrice,
        "product_id": productId,
        "color": List<dynamic>.from(color!.map((x) => x)),
      };

  @override
  List<Object?> get props => [
        id,
        weight,
        quantity,
        discount,
        finalPrice,
        actualPrice,
        productId,
        color
      ];
}
