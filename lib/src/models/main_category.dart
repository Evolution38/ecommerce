// To parse this JSON data, do
//
//     final mainCategoryModel = mainCategoryModelFromJson(jsonString);

import 'dart:convert';

MainCategoryModel mainCategoryModelFromJson(String str) => MainCategoryModel.fromJson(json.decode(str));

String mainCategoryModelToJson(MainCategoryModel data) => json.encode(data.toJson());

class MainCategoryModel {
    MainCategoryModel({
        this.result,
    });

    List<Result>? result;

    factory MainCategoryModel.fromJson(Map<String, dynamic> json) => MainCategoryModel(
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
