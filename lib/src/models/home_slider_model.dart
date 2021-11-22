// To parse this JSON data, do
//
//     final homeSliderModel = homeSliderModelFromJson(jsonString);

import 'dart:convert';

HomeSliderModel homeSliderModelFromJson(String str) =>
    HomeSliderModel.fromJson(json.decode(str));

String homeSliderModelToJson(HomeSliderModel data) =>
    json.encode(data.toJson());

class HomeSliderModel {
  HomeSliderModel({
    this.result,
  });

  List<Result>? result;

  factory HomeSliderModel.fromJson(Map<String, dynamic> json) =>
      HomeSliderModel(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.imagePath,
    this.maincatId,
    this.maincatName,
    this.productId,
  });

  String? id;
  String? imagePath;
  int? maincatId;
  String? maincatName;
  int? productId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["ID"],
        imagePath: json["image_path"],
        maincatId: json["maincat_id"],
        maincatName: json["maincat_name"],
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "image_path": imagePath,
        "maincat_id": maincatId,
        "maincat_name": maincatName,
        "product_id": productId,
      };
}
