import 'package:ecommerce/src/Constants/app_constants.dart';
import 'package:ecommerce/src/models/new_arrival_model.dart';
import 'package:ecommerce/src/services/http_service.dart';
import 'package:get/get.dart';

class NewArrivalController extends GetxController {
  RxBool isLoading = true.obs;
  var data = NewArrivalModel();

  var variantData = [].obs;
  var weightData = "WeightData".obs;
  var newWeight = "newWeight".obs;

  @override
  void onInit() {
    newarrival();
    super.onInit();
  }

  newarrival() async {
    var result = await HttpService.getNewArrival();
    data = NewArrivalModel.fromJson(result);
    isLoading(false);
    logger.d("[NewArrivalsController] data: " + data.toString());
  }

  void getProductID(String id) {
    for (var i in data.result!) {
      if (i.id == id) {
        if (i.variant!.isNotEmpty) {
          variantData.clear();
          for (var element in i.variant!) {
            variantData.add(element.weight);
            logger.d("[NewArivalController] " + variantData.toString());
          }
          // logger.d('[NewArrivalsController] weightdata: ' + weightData.value);
        }
        // variantData.isEmpty ? weightData.value : newWeight.value = variantData[0];
        // /*data!.isEmpty? dropdownValue:*/dropdownValue = data![0];
      }
    }
  }

  void updateWeight(String value) {
    weightData.value = value;
    logger.d('[NewArrivalsController] weightdata: ' + weightData.value);
  }
}
