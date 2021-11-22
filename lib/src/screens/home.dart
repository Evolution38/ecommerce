// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, use_key_in_widget_constructors,
import 'package:ecommerce/src/Widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Carousel(),
                  const SizedBox(height: 20),
                  Titlehead(
                    text: 'Shop by Categories',
                  ),
                  ShopCategory(),
                  RandomCard(),
                ],
              ),
            ),
    );
  }
}

class Titlehead extends StatelessWidget {
  final String? text;

  const Titlehead({this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 15, right: 25, bottom: 15),
          child: Text(
            text!,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple),
          ),
        ),
      ],
    );
  }
}
