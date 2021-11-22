// To parse this JSON data, do
//
//     final randomcategoryModel = randomcategoryModelFromJson(jsonString);

import 'dart:convert';

RandomCategoryModel categoryModelFromJson(String str) => RandomCategoryModel.fromJson(json.decode(str));

String categoryModelToJson(RandomCategoryModel data) => json.encode(data.toJson());

class RandomCategoryModel {
    RandomCategoryModel({
        this.result,
    });

    List<Result>? result;

    factory RandomCategoryModel.fromJson(Map<String, dynamic> json) => RandomCategoryModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.mainCatId,
        this.mainName,
        this.imagePath,
        this.products,
    });

    String? mainCatId;
    String? mainName;
    String? imagePath;
    List<Product>? products;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        mainCatId: json["main_cat_id"],
        mainName: json["main_name"],
        imagePath: json["image_path"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "main_cat_id": mainCatId,
        "main_name": mainName,
        "image_path": imagePath,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}

class Product {
    Product({
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

    String? id;
    String? name;
    dynamic categoryName;
    String? finalPrice;
    String? actualPrice;
    String? discount;
    String? qty;
    String? description;
    List<Image>? images;
    List<Variant>? variant;
    List<dynamic>? color;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["ID"],
        name: json["name"],
        categoryName: json["category_name"],
        finalPrice: json["final_price"],
        actualPrice: json["actual_price"],
        discount: json["discount"],
        qty: json["qty"],
        description: json["description"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        variant: List<Variant>.from(json["variant"].map((x) => Variant.fromJson(x))),
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
}

class Image {
    Image({
        this.imgId,
        this.imgProduct,
    });

    String? imgId;
    String? imgProduct;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        imgId: json["img_id"],
        imgProduct: json["img_product"],
    );

    Map<String, dynamic> toJson() => {
        "img_id": imgId,
        "img_product": imgProduct,
    };
}

class Variant {
    Variant({
        this.id,
        this.weight,
        this.quantity,
        this.discount,
        this.finalPrice,
        this.actualPrice,
        this.productId,
        this.color,
    });

    String? id;
    String? weight;
    String? quantity;
    String? discount;
    String? finalPrice;
    String? actualPrice;
    String? productId;
    List<dynamic>? color;

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
}