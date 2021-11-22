// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'dart:convert';

SubCategoryModel subCategoryModelFromJson(String str) => SubCategoryModel.fromJson(json.decode(str));

String subCategoryModelToJson(SubCategoryModel data) => json.encode(data.toJson());

class SubCategoryModel {
    SubCategoryModel({
        this.result,
    });

    List<Result>? result;

    factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.id,
        this.name,
        this.imagePath,
        this.nextCat,
    });

    String? id;
    String? name;
    String? imagePath;
    bool? nextCat;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["ID"],
        name: json["name"],
        imagePath: json["image_path"],
        nextCat: json["nextCat"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "name": name,
        "image_path": imagePath,
        "nextCat": nextCat,
    };
}
