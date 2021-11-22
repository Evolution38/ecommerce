import 'dart:convert';

import 'package:ecommerce/src/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static Future getHomeSliderModel() async {
    var response = await http.get(Uri.parse(GET_HOME_SLIDER_URL));
    var jsonData = json.decode(response.body);
    // var jsonResponse = homeSliderModelFromJson(response.body);
    // debugPrint("[HttpService]  getHomeSliderModel(): ");
    // debugPrint(jsonResponse.result.toString());
    return jsonData;
  }

  static Future getCategory() async {
    var response = await http.get(Uri.parse(GET_MAIN_CATEGORY_URL));
    var jsonData = json.decode(response.body);
    return jsonData;
  }

  static Future getRandomCategory() async {
    var response = await http.get(Uri.parse(GET_RANDOM_CATEGORY_URL));
    var jsonData = json.decode(response.body);
    return jsonData;
  }

  static Future getNewArrival() async {
    var response = await http.get(Uri.parse(GET_NEW_ARRIVAL_URL));
    var jsonData = json.decode(response.body);
    return jsonData;
  }

  // static Future getSearchProduct({@required Map? body}) async {
  //   // ignore: avoid_print
  //   print(body);
  //   return http
  //       .post(Uri.parse(GET_SEARCH_CATEGORY_URL), body: body)
  //       .then((http.Response response) {
  //     final int statuscode = response.statusCode;

  //     if (statuscode < 200 || statuscode > 400) {
  //       throw Exception("[SearchCategory] Error in Post");
  //     }

  //     return json.decode(response.body);
  //   });
  // }

  static Future getSearchProduct(String query) async {
    final url = Uri.parse(GET_SEARCH_CATEGORY_URL);
    final response = await http.get(url);
    return json.decode(response.body);
    // if(response.statusCode == 200){
    //   final
    // }
  }
}

Future getSubCategory({required String id}) async {
  var url = "$GET_SUB_CATEGORY_URL$id";
  debugPrint("[HTTP Service] getSubCategory() id: " + id);
  final response = await http.get(Uri.parse(url));
  // print(response.body);
  return json.decode(response.body);
}
