import 'package:ecommerce/src/Constants/app_constants.dart';
import 'package:ecommerce/src/models/new_arrival_model.dart';
import 'package:ecommerce/src/services/http_service.dart';
import 'package:get/get.dart';

class NewArrivalController extends GetxController {
  RxBool isLoading = true.obs;
  NewArrivalModel? data;

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
}
