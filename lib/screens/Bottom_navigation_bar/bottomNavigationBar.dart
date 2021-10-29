// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sample_project/screens/Bottom_navigation_bar/BottomBarcontroller.dart';
import 'package:sample_project/screens/FavouritesListPage/FavouritesPage.dart';
import 'package:sample_project/screens/ProductListPage/ProductView/ProductListPage.dart';
import 'package:sample_project/screens/ProductListPage/ProductView/SingleProductViewPage.dart';
import 'package:sample_project/screens/Profile/profile_page.dart';
import 'package:sample_project/screens/cart/cart.dart';
import 'package:sample_project/screens/login/login.dart';
import 'package:sample_project/themes/app_colors.dart';

class BottomNavigatorWidget extends StatelessWidget {
  final BottomNavigatorController controller =
      Get.put(BottomNavigatorController());

  final _pages = [
    const CookiePage(),
    const FavouritesPage(),
    //MyLogIn(),
    CartPage(),
    ProfileScreen()
    //  const FavouritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigatorController>(
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          backgroundColor: const Color(0xFFFCFAF8),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.widgets_rounded,
                color: Color.fromRGBO(255, 146, 146, 1),
              ),
              onPressed: () {},
            ),
            title: const Text('Profile',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  color: Color(0xFF545D68),
                )),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.person_pin, color: Appcolors.appPink),
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => const SingleProductViewPage()));
                },
              ),
            ],
          ),
          body: SafeArea(
            child: _pages[controller.tabIndex.value],
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
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
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

                selectedItemColor: Color(0xFF2e3192),
                onTap: controller.changeTabIndex,
                currentIndex: controller.tabIndex.value,
                selectedIconTheme: const IconThemeData(
                  color: Appcolors.appPink,
                ),

                // backgroundColor: Colors.white,
                elevation: 50,
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
              ),
            ),
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
