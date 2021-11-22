// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:ecommerce/src/Constants/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

AppBar MyAppBar() => AppBar(
      backgroundColor: AppColors.primaryappcolor,
      centerTitle: true,
      title: Row(mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Image.asset(
              'assets/images/appbar-removebg.png',
              fit: BoxFit.contain,
              height: 55,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
            )
          ]),
      actions: <Widget>[
        // IconButton(
        //     onPressed: () {
        //       showSearch(context: context, delegate: Search());
        //     },
        //     icon: const Icon(Icons.search)),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_rounded,
          ),
        )
      ],
      elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      // leading: Builder(
      //   builder: (BuildContext context) {
      //     return IconButton(
      //       icon: const Icon(Icons.menu),
      //       onPressed: () {
      //         MyDrawer();
      //       },
      //       // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //     );
      //   },
      // ),
    );

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Image.asset('assets/images/splash.jpg'),
          ),
          Divider(color: AppColors.primaryappcolor),
          ListTile(
            leading: Icon(
              Icons.home,
              color: AppColors.primaryappcolor,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: AppColors.primaryappcolor, fontSize: 18),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: AppColors.primaryappcolor,
            ),
            title: Text(
              'About Us',
              style: TextStyle(color: AppColors.primaryappcolor, fontSize: 18),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.local_offer,
              color: AppColors.primaryappcolor,
            ),
            title: Text(
              'My Discounts',
              style: TextStyle(color: AppColors.primaryappcolor, fontSize: 18),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: AppColors.primaryappcolor,
            ),
            title: Text(
              'My Profile',
              style: TextStyle(color: AppColors.primaryappcolor, fontSize: 18),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.location_history,
              color: AppColors.primaryappcolor,
            ),
            title: Text(
              'Track My Orders',
              style: TextStyle(color: AppColors.primaryappcolor, fontSize: 18),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.maps_home_work_outlined,
              color: AppColors.primaryappcolor,
            ),
            title: Text(
              'My Addresses',
              style: TextStyle(color: AppColors.primaryappcolor, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
