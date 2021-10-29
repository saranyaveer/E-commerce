// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_project/screens/ProductListPage/ProductView/Bottombar.dart';
import 'package:sample_project/screens/ProductListPage/product_controller.dart';

class SingleProductViewPage extends GetView<ProductController> {
  const SingleProductViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      extendBody: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: SafeArea(child: Obx(() {
        if (productController.isLoading.value == false) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  backgroundBlendMode: BlendMode.clear,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        //color: Appcolors.appPink,
                        spreadRadius: 0,
                        blurRadius: 10),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                  child: Image.network(
                    productController.singleProd.value.image.toString(),
                    // "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  productController.singleProd.value.title
                                      .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "\$" +
                                      productController.singleProd.value.price
                                          .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                        //   if (productController.singleProd.value != null){}
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            productController.singleProd.value.category
                                .toString(),
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 13,
                                color: Colors.blueGrey.shade700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            productController.singleProd.value.description
                                .toString(),
                            style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      })),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
