import 'package:ecommerce/src/Constants/app_constants.dart';
import 'package:ecommerce/src/models/new_arrival_model.dart';
import 'package:ecommerce/src/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewArrivalController extends GetxController {
  RxBool isLoading = true.obs;
  var data = const NewArrivalModel();

  var variantData = [].obs;
  var weightData = "".obs;
  var price = "".obs;

  @override
  void onInit() {
    newarrival();
    super.onInit();
  }

  newarrival() async {
    var result = await HttpService.getNewArrival();
    data = NewArrivalModel.fromJson(result);
    isLoading(false);
  }

  void getProductID(String id) {
    for (var i in data.result!) {
      if (i.id == id) {
        if (i.variant!.isNotEmpty) {
          variantData.clear();
          for (var element in i.variant!) {
            variantData.add(element.weight);
          }
        }
        variantData.isEmpty
            ? weightData.value
            : weightData.value = variantData[0];

        
      }
    }
  }

  void updateWeight(String value) {
    logger.d("[NewArricalsController] updateweight() value: " + value);
    weightData.value = value;
    for (var i = 0; i < data.result!.length; i++) {
      for (var j in data.result![i].variant!) {
        if (value == j.weight) {
          price.value = j.actualPrice!;
        }
      }
    }


    logger.d("[NewArricalsController] UpdateWeight() Price: " + price.value);
  }

  void updatePrice(String id) {
    logger.d("[NewArricalsController] updatePrice() ID: " + id);
    for (var i = 0; i < data.result!.length; i++) {
      for (var j in data.result![i].variant!) {
        if (id == j.id && weightData.value == j.weight) {
          price.value = j.actualPrice!;
        }
      }
    }

    logger.d("[NewArricalsController] updatePrice()  Price: " + price.value);
  }
}
