// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/src/Widgets/product_details.dart';
import 'package:ecommerce/src/models/random_category_model.dart';
import 'package:ecommerce/src/services/http_service.dart';
import 'package:flutter/material.dart';

class RandomCard extends StatefulWidget {
  RandomCard({Key? key}) : super(key: key);

  @override
  _RandomCardState createState() => _RandomCardState();
}

class _RandomCardState extends State<RandomCard> {
  var randomcategory;
  bool isloading = true;
  randomcategories() async {
    var result = await HttpService.getRandomCategory();
    setState(() {
      randomcategory = RandomCategoryModel.fromJson(result);
      isloading = false;
      debugPrint("[RandomCard] data: " + randomcategory.result[0].mainName);
      debugPrint("[RandomCard] data: " +
          randomcategory.result[0].products[0].images[0].imgProduct);
      debugPrint("[RandomCard] data: " +
          randomcategory.result[1].products[0].images[0].imgProduct);
    });
  }

  @override
  void initState() {
    randomcategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            child: ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: randomcategory.result.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 15, right: 25, bottom: 15),
                      child: Text(
                        randomcategory.result![index].mainName,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      height: 160,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            randomcategory.result![index].products.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ProductDetails(
                                            carousellength: randomcategory
                                                .result[index]
                                                .products[i]
                                                .images
                                                .length,
                                            discription: randomcategory
                                                .result[index]
                                                .products[i]
                                                .description,
                                            imagesurl: randomcategory
                                                .result[index]
                                                .products[i]
                                                .images,
                                            price: "Rs " +
                                                randomcategory.result[index]
                                                    .products[i].actualPrice +
                                                ".00",
                                            productname: randomcategory
                                                .result[index].products[i].name,
                                            variant: randomcategory.result[index].products[i].variant,
                                            stock: 'Out of Stock',
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SizedBox(
                                height: 200,
                                width: 130,
                                child: Card(
                                  elevation: 2.0,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        child: CachedNetworkImage(
                                          imageUrl: randomcategory.result[index]
                                              .products[i].images[0].imgProduct,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(randomcategory
                                            .result[index].products[i].name),
                                      )),
                                      const SizedBox(
                                        width: 150,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: Colors.blue),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Rs ' +
                                            randomcategory.result[index]
                                                .products[i].actualPrice +
                                            '.00'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          );
  }
}
