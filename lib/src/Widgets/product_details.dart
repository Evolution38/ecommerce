// import 'package:ecommerce/src/Widgets/my_app_bar.dart';
// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/src/Constants/colors.dart';
import 'package:ecommerce/src/Widgets/my_app_bar.dart';
import 'package:ecommerce/src/controllers/new_arrivals_controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  List? imagesurl = [];
  String price;
  List? variant;
  String productname;
  String stock;
  String description;
  int? carousellength;

  ProductDetails(
      {Key? key,
      this.imagesurl,
      this.price = '',
      this.variant,
      this.productname = '',
      this.stock = '',
      this.description = '',
      this.carousellength})
      : super(key: key);
  final _controller = Get.find<NewArrivalController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: /*1*/ carousellength,
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) {
                    // debugPrint("[ProductDetails] imagesUrl: " +
                    //     widget.imagesurl![index].toString());
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      //margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              /*'https://static.toiimg.com/photo/75503656.cms'*/
                              imagesurl![index].imgProduct),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: false,
                    autoPlay: false,
                    aspectRatio: 2,
                    initialPage: 0,
                    pageSnapping: true,
                    // autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: false,
                    // autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                ),
              ),
              Divider(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  //Showing Product Name
                  Expanded(
                    child: Text(
                      productname,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 50),
                  //Showing the stock
                  Obx(
                    () {
                      return Text(
                        _controller.variantData.isEmpty
                            ? stock
                            : _controller.quantity.value,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15),

              //**Price of Product----------------------------------------------

              Obx(() {
                return Text(
                  _controller.variantData.isEmpty
                      ? price
                      : "Rs " + _controller.price.value + ".00",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                );
              }),
              const SizedBox(height: 10),

              //**Product Variants use to show the size or quantity-------------
              //**Checking the Variants in API-----------------------------------
              _controller.variantData.isEmpty
                  ? SizedBox.shrink()
                  : Row(
                      children: [
                        Text(
                          'Weight/Size',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(width: 4),
                        Container(
                          padding: EdgeInsets.only(left: 3, right: 3),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.primaryappcolor),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Obx(
                            () {
                              // logger.d("[ProductDetails] wieghtData: " +
                              //     _controller.variantData.toString());
                              // logger.d("[ProductDetails] Price " +_controller.price.value);
                              return DropdownButton<dynamic>(
                                value: _controller.weightData.value,
                                onChanged: (newvalue) {
                                  _controller.updateWeight(newvalue);
                                },
                                items: _controller.variantData.map(
                                  (selectedType) {
                                    return DropdownMenuItem(
                                      value: selectedType,
                                      child: Text(selectedType),
                                    );
                                  },
                                ).toList(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  //**To check the availability---------------------------------

                  Text(
                    'Check Availability',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                  ),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppColors.primaryappcolor),
                              ),
                              hintText: 'Enter the Pincode'),
                        ),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            alignment: Alignment.center,
                            primary: AppColors.primaryappcolor),
                        onPressed: () {},
                        child: Text('Check Availabilty'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              //**Adding product to the Cart------------------------------------

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      primary: AppColors.primaryappcolor),
                  onPressed: () {},
                  child: Text('Add To Cart'),
                ),
              ),
              SizedBox(height: 9),
              //Discription of the product
              SizedBox(
                // height: MediaQuery.of(context).size.width,
                width: double.infinity,
                child: Html(
                  data: description,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
