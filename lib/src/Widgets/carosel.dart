// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/src/models/home_slider_model.dart';
import 'package:ecommerce/src/services/http_service.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  var data;
  bool isLoading = true;
  carsouleData() async {
    var result = await HttpService.getHomeSliderModel();
    setState(() {
      data = HomeSliderModel.fromJson(result);
      isLoading = false;
      debugPrint("[Carousel] data: " + data.result![1].imagePath!);
    });
  }

  @override
  void initState() {
    carsouleData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              shrinkWrap: true,
              children: [
                CarouselSlider.builder(
                  itemCount: data.result!.length,
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      //margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            data.result![index].imagePath!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 0 / 0,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.9,
                  ),
                ),
                // CarouselSlider(
                //     items: [
                //       Container(
                //         width: MediaQuery.of(context).size.width,
                //         height: MediaQuery.of(context).size.height,
                //         //margin: EdgeInsets.all(6.0),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(8.0),
                //           image: DecorationImage(
                //             image: AssetImage('assets/images/carosel1.jpg'),
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         width: MediaQuery.of(context).size.width,
                //         // margin: EdgeInsets.all(6.0),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(8.0),
                //           image: DecorationImage(
                //             image: AssetImage('assets/images/carosel2.jpg'),
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         // margin: EdgeInsets.all(6.0),
                //         width: MediaQuery.of(context).size.width,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(8.0),
                //           image: DecorationImage(
                //             image: AssetImage('assets/images/carosel3.jpg'),
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         // margin: EdgeInsets.all(6.0),
                //         width: MediaQuery.of(context).size.width,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(8.0),
                //           image: DecorationImage(
                //             image: AssetImage('assets/images/carosel4.jpg'),
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         // margin: EdgeInsets.all(6.0),
                //         width: MediaQuery.of(context).size.width,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(8.0),
                //           image: DecorationImage(
                //             image: AssetImage('assets/images/carosel5.jpg'),
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //       ),
                //     ],
                //     options: CarouselOptions(
                //       height: 200.0,
                //       enlargeCenterPage: true,
                //       autoPlay: true,
                //       aspectRatio: 0 / 0,
                //       autoPlayCurve: Curves.fastOutSlowIn,
                //       enableInfiniteScroll: true,
                //       autoPlayAnimationDuration: Duration(milliseconds: 800),
                //       viewportFraction: 0.8,
                //     ))
              ],
            ),
    );
  }
}
