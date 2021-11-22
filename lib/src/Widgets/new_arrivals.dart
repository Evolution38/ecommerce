// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/src/Constants/app_constants.dart';
import 'package:ecommerce/src/Widgets/product_details.dart';
import 'package:ecommerce/src/controllers/new_arrivals_controllers.dart';
import 'package:ecommerce/src/models/new_arrival_model.dart';
import 'package:ecommerce/src/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewArrivals extends StatefulWidget {
  const NewArrivals({Key? key}) : super(key: key);

  @override
  _NewArrivalsState createState() => _NewArrivalsState();
}

class _NewArrivalsState extends State<NewArrivals> {
  var data;
  bool isloading = true;
  newarrival() async {
    var result = await HttpService.getNewArrival();
    setState(() {
      data = NewArrivalModel.fromJson(result);
      logger.d("Data type" + data.runtimeType.toString());
      isloading = false;
      debugPrint("[NewArrivals] data: " + data.result[0].images[0].imgProduct);
      debugPrint("[NewArrivals] data: " + data.result[0].name);
      debugPrint("[NewArrivals] data: " + data.result[0].finalPrice);
    });
  }

  // final newArivalsController = Get.put(NewArrivalController())

  @override
  void initState() {
    newarrival();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.result.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return SizedBox(
                height: 500,
                width: 300,
                child: InkWell(
                  onTap: () {
                    // debugPrint("[NewArrivals] Data length of images:" +
                    //     data.result[index].images.toString());
                    debugPrint("[NewArrivals] Variant Length" +
                        data.result[index].variant.length.toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetails(
                          carousellength: data.result[index].images.length,
                          discription: data.result[index].description,
                          imagesurl: data.result[index].images,
                          price: "Rs " +
                              data.result[index].variant[0].actualPrice +
                              ".00",
                          productname: data.result[index].name,
                          variant: data.result[index].variant,
                          stock: 'Out of Stock',
                          // weights: [
                          //   data.result[index].variant[0].weight,
                          //   // data.result[index].variant[1].weight
                          // ],
                        ),
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
                              imageUrl: data.result[index].images[0].imgProduct,
                              fit: BoxFit.cover),
                        ),
                        Expanded(
                          child: Text(
                            data.result[index].name,
                            style: TextStyle(
                                height:
                                    MediaQuery.of(context).size.height / 350),
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
                          "Rs " + data.result[index].actualPrice + ".00",
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
}
