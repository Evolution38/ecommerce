// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/src/Constants/colors.dart';
import 'package:ecommerce/src/Widgets/new_arrivals.dart';
import 'package:ecommerce/src/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  final _screens = [
    HomePage(),
    // Scaffold(body: Center(child: Text('Home'))),
    NewArrivals(),
    const Scaffold(body: Center(child: Text('Orders'))),
    const Scaffold(body: Center(child: Text('My Profile'))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryappcolor,
          onPressed: () {},
          child: Icon(Icons.shopping_cart_outlined)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: PersistentTabView(
        context,
        neumorphicProperties: NeumorphicProperties(showSubtitleText: true),
        navBarHeight: 55,
        controller: _controller,
        screens: _screens,
        items: _navBarItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: false,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: false,
        ),
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        inactiveIcon: Icon(Icons.home_outlined),
        title: ('Home'),
        activeColorPrimary: AppColors.primaryappcolor,
        inactiveColorPrimary: AppColors.primaryappcolor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.new_releases),
        inactiveIcon: Icon(Icons.new_releases_outlined),
        title: ('New Arrivals'),
        activeColorPrimary: AppColors.primaryappcolor,
        inactiveColorPrimary: AppColors.primaryappcolor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_bag),
        inactiveIcon: Icon(Icons.shopping_bag_outlined),
        title: ('Orders'),
        activeColorPrimary: AppColors.primaryappcolor,
        inactiveColorPrimary: AppColors.primaryappcolor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_circle),
        inactiveIcon: Icon(Icons.account_circle_outlined),
        title: ('My Profile'),
        activeColorPrimary: AppColors.primaryappcolor,
        inactiveColorPrimary: AppColors.primaryappcolor,
      ),
    ];
  }
}

// floatingActionButton: FloatingActionButton(
//   backgroundColor: AppColors.primaryappcolor,
//   onPressed: () {},
//   child: Icon(Icons.shopping_cart_outlined),
//   // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// ),

// floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// bottomNavigationBar: BottomNavigationBar(
//   type: BottomNavigationBarType.fixed,
//   selectedItemColor: AppColors.selectedcolor,
//   unselectedItemColor: AppColors.unselectedcolor,
//   currentIndex: _selectedIndex,
//   items: const <BottomNavigationBarItem>[
//     BottomNavigationBarItem(
//         icon: Icon(Icons.home_outlined),
//         activeIcon: Icon(Icons.home),
//         label: 'Home'),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.new_releases_outlined),
//         activeIcon: Icon(Icons.new_releases),
//         label: 'New Arrivals'),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.shopping_bag_outlined),
//         activeIcon: Icon(Icons.shopping_bag),
//         label: 'Orders'),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.account_circle_outlined),
//         activeIcon: Icon(Icons.account_circle),
//         label: 'My Profile'),
//   ],
//   onTap: (i) => setState(() {
//     _selectedIndex = i;
//   }),
//   selectedFontSize: 10,
//   unselectedFontSize: 10,
// ),
// floatingActionButton: FloatingActionButton(
//   backgroundColor: AppColors.primaryappcolor,
//   onPressed: () {},
//   child: Icon(Icons.shopping_cart_outlined),
// ),
// floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,