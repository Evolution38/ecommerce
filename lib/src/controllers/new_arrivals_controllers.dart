import 'package:ecommerce/src/models/new_arrival_model.dart';
import 'package:ecommerce/src/services/http_service.dart';
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
    weightData.value = value;
  }
}
