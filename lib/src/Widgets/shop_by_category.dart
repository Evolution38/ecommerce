// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/src/models/main_category.dart';
import 'package:ecommerce/src/models/sub_category_model.dart';
import 'package:ecommerce/src/services/http_service.dart';
import 'package:flutter/material.dart';

class ShopCategory extends StatefulWidget {
  @override
  State<ShopCategory> createState() => _ShopCategoryState();
}

class _ShopCategoryState extends State<ShopCategory> {
  var id;
  var shopcategory;
  bool isloading = true;
  loadcategories() async {
    var result = await HttpService.getCategory();
    setState(() {
      shopcategory = MainCategoryModel.fromJson(result);
      isloading = false;
      debugPrint("[ShopCategory] data: " + shopcategory.result![0].imagePath);
      debugPrint("[ShopCategory] data: " + shopcategory.result![0].name);
    });
  }

  var subcategory;
  // bool isloading = true;
  loadsubcategory(String id) async {
    var result = await getSubCategory(id: id);
    setState(() {
      subcategory = SubCategoryModel.fromJson(result);
      isloading = false;
      debugPrint(
          "[SubCategory] data:" + subcategory.result[1].imagePath.toString());
    });
  }

  @override
  void initState() {
    loadcategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GestureDetector(
              onTap: () {},
              child: GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: shopcategory.result.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  // id = shopcategory.result![index].id;
                  // debugPrint("[ShopByCategory] subCategory ID: " +
                  //     shopcategory.result![index].id);
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: InkWell(
                      onTap: () async {
                        await loadsubcategory(shopcategory.result![index].id);
                        isloading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    elevation: 16,
                                    child: Container(
                                      child: ListView(
                                        physics: ScrollPhysics(),
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          SizedBox(height: 20),
                                          Center(
                                              child: Text(
                                            shopcategory.result![index].name,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                          SizedBox(height: 20),
                                          _something(),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                      },
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(width: 1)),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 12,
                              child: CachedNetworkImage(
                                imageUrl: shopcategory.result![index].imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                                child: Text(shopcategory.result![index].name))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget _something() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: subcategory.result.length,
              itemBuilder: (context, index) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.height * 0.1,
                  margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          child: Image(
                            image: CachedNetworkImageProvider(
                                subcategory.result[index].imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(12.0),
                          child: Center(
                            child: Text(
                              subcategory.result[index].name,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}