// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/src/Constants/app_constants.dart';
import 'package:ecommerce/src/Widgets/product_details.dart';
import 'package:ecommerce/src/controllers/new_arrivals_controllers.dart';
import 'package:ecommerce/src/models/new_arrival_model.dart';
import 'package:ecommerce/src/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewArrivals extends StatelessWidget {
  final newArivalsController = Get.put(NewArrivalController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (newArivalsController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: newArivalsController.data.result!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return SizedBox(
              height: 500,
              width: 300,
              child: InkWell(
                onTap: () {
                  newArivalsController.getProductID(
                      newArivalsController.data.result![index].id!);
                  // debugPrint("[NewArrivals] Data length of images:" +
                  //     data.result[index].images.toString());
                  debugPrint("[NewArrivals] Variant Length" +
                      newArivalsController.data.result![index].variant!.length
                          .toString());
                  Get.to(
                    () => ProductDetails(
                      carousellength: newArivalsController
                          .data.result![index].images!.length,
                      description:
                          newArivalsController.data.result![index].description!,
                      imagesurl:
                          newArivalsController.data.result![index].images,
                      price: "Rs " +
                          newArivalsController
                              .data.result![index].variant![0].actualPrice! +
                          ".00",
                      productname:
                          newArivalsController.data.result![index].name!,
                      variant: newArivalsController.data.result![index].variant,
                      stock: 'Out of Stock',
                      // weights: [
                      //   data.result[index].variant[0].weight,
                      //   // data.result[index].variant[1].weight
                      // ],
                    ),
                  );
                },
                child: Card(
                  elevation: 5.0,
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 6,
                        child: CachedNetworkImage(
                            imageUrl: newArivalsController
                                .data.result![index].images![0].imgProduct!,
                            fit: BoxFit.cover),
                      ),
                      Expanded(
                        child: Text(
                          newArivalsController.data.result![index].name!,
                          style: TextStyle(
                              height: MediaQuery.of(context).size.height / 350),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        child: const DecoratedBox(
                          decoration: BoxDecoration(color: Colors.black),
                        ),
                      ),
                      Text(
                        "Rs " +
                            newArivalsController
                                .data.result![index].actualPrice! +
                            ".00",
                        style: TextStyle(
                            height: MediaQuery.of(context).size.height / 500),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
    });
  }
}
