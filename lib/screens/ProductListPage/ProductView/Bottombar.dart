// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sample_project/themes/app_colors.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.transparent,
        elevation: 9.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
            height: 90.0,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                color: Colors.white),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: height / 7,
                      width: MediaQuery.of(context).size.width, //- 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(4),
                            margin: const EdgeInsets.only(
                                top: 0, bottom: 10, left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(25.0)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 3.0,
                                      blurRadius: 5.0)
                                ],
                                color: Colors.pinkAccent),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Buy Now",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          // const CircleAvatar(
                          //   backgroundImage:
                          //       AssetImage("lib/assets/images/cart_pink.png"),
                          //   radius: 35,
                          // ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.shopping_cart_rounded,
                                  size: 30, color: Colors.pinkAccent))
                        ],
                      )),
                  // Container(
                  //     height: 50.0,
                  //     width: MediaQuery.of(context).size.width / 2 - 40.0,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       children: const <Widget>[
                  //         Icon(Icons.search, color: Color(0xFF676E79)),
                  //         Icon(Icons.shopping_basket, color: Color(0xFF676E79))
                  //       ],
                  //     )
                  //     ),
                ])));
  }
}
