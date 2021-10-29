// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sample_project/themes/app_colors.dart';

/// This is the stateful widget that the main application instantiates.
class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

/// This is the private State class that goes with MyBottomBar.
class _MyBottomBarState extends State<MyBottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    //Get.toNamed('/singleproductlistpage');
    // const CookiePage(),
    // const FavouritesPage(),
    // const CartPage(),
    // const FavouritesPage(),
    const Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    const Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    const Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    const Text('Last Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            backgroundBlendMode: BlendMode.clear,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          height: MediaQuery.of(context).size.height * 0.070,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedIconTheme: const IconThemeData(
                color: Appcolors.appPink,
              ),
              // selectedItemColor: AppColors.baseDarkPinkColor,
              onTap:
                  // Get.toNamed('/singleproductlistpage');
                  _onItemTapped,
            ),
          ),
        ));
  }
}
