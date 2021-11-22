// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, sized_box_for_whitespace
import 'dart:async';

import 'package:ecommerce/src/screens/navscreen.dart';
import 'package:ecommerce/test.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'src/Constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      theme: ThemeData(primaryColor: AppColors.primaryappcolor),
      debugShowCheckedModeBanner: false,
      title: 'Grocery',
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // HttpService.getHomeSliderModel();
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => NavScreen()), (route) => false);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image(image: AssetImage('assets/images/splash.jpg')),
            )
            // Text(
            //   'Splash Screen',
            //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            // ),
          ],
        ),
      ),
    );
  }
}
