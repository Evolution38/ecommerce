import 'package:ecommerce/src/Constants/app_constants.dart';
import 'package:ecommerce/src/models/new_arrival_model.dart';
import 'package:ecommerce/src/services/http_service.dart';
import 'package:get/get.dart';

class NewArrivalController extends GetxController {
  RxBool isLoading = true.obs;
  var data = const NewArrivalModel();

  var variantData = [].obs;
  var weightData = "".obs;
  var price = "".obs;
  var quantity = "".obs;

  @override
  void onInit() {
    newarrival();
    super.onInit();
  }

  @override
  void onClose() {
    newarrival();
    super.onClose();
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
    weightData.value = value;
    for (var i = 0; i < data.result!.length; i++) {
      for (var j in data.result![i].variant!) {
        if (value == j.weight) {
          price.value = j.actualPrice!;
          quantity.value = j.quantity!;
        }
      }
    }
  }

  void updatePrice(String id) {
    for (var i = 0; i < data.result!.length; i++) {
      for (var j in data.result![i].variant!) {
        if (id == j.id && weightData.value == j.weight) {
          price.value = j.actualPrice!;
        }
      }
    }
  }

  void updateQuantity(String id) {
    for (var i = 0; i < data.result!.length; i++) {
      for (var j in data.result![i].variant!) {
        if (id == j.id && weightData.value == j.weight) {
          quantity.value = j.quantity!;
        }
      }
    }
  }
}
