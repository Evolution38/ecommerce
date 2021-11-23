// ----------------------------------------------------Internet Connectivity-----------------------------------------------

// import 'package:ecommerce/src/Widgets/my_app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_offline/flutter_offline.dart';

// class Connectivity extends StatelessWidget {
//   const Connectivity({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(),
//       body: OfflineBuilder(
//         connectivityBuilder: (context, connectivity, child) {
//           final bool connected = connectivity != ConnectivityResult.none;
//           return Stack(
//             fit: StackFit.expand,
//             children: [
//               Positioned(
//                 height: 24,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   color: connected ? const Color(0xFF00EE44) : const Color(0xFFEE4400),
//                   child: Center(
//                     child: Text(connected ? 'ONLINE' : 'OFFLINE'),
//                   ),
//                 ),
//               ),
//               const Center(
//                 child: Text(
//                   'Hello!'
//                 ),
//               ),
//             ],
//           );
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const[
//             Text('Just turn off your internet')
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:ecommerce/src/Widgets/my_app_bar.dart';
// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/src/Constants/app_constants.dart';
import 'package:ecommerce/src/Constants/colors.dart';
import 'package:ecommerce/src/Widgets/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';



class ProductDetailsTest extends StatelessWidget {

  
  List? imagesurl = [];
  String price;
  List? variant;
  String productname;
  String stock;
  String discription;
  int? carousellength;

  ProductDetailsTest(
      {Key? key,
      this.imagesurl,
      this.price = '',
      this.variant,
      this.productname = '',
      this.stock = '',
      this.discription = '',
      this.carousellength})
      : super(key: key);
  List? data = [];
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    debugPrint('[ProductDetails] Variants:' + variant.toString());
    if (variant!.isNotEmpty) {
      data!.clear();
      for (var element in variant!) {
        data!.add(element.weight);
        // logger.d(element.weight);
      }
    }
    // /*data!.isEmpty? dropdownValue:*/dropdownValue = data![0];
    // setState(() {
    //   data!.isEmpty ? dropdownValue : dropdownValue = data![0];
    // });
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
                  Text(
                    stock,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              //**Price of Product----------------------------------------------

              Text(
                price,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              //**Product Variants use to show the size or quantity-------------
              //**Checking the Variants in API-----------------------------------
              variant!.isEmpty
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
                          child: DropdownButton<dynamic>(
                            value: dropdownValue,
                            // hint: Text('\t Select \t'),
                            onChanged: (newvalue) {
                              // setState(() {
                              //   dropdownValue = newvalue;
                              //   // dropdownValue;
                              //   print(dropdownValue);
                              // });
                            },
                            items: data!.map<DropdownMenuItem<dynamic>>(
                              (value) {
                                return DropdownMenuItem<dynamic>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
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
                  data: discription,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

