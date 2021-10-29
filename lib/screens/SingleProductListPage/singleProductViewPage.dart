// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_project/screens/SingleProductListPage/singleProductController.dart';
import 'package:sample_project/themes/app_colors.dart';

class SingleProductViewPage extends GetView<SingleProductController> {
  const SingleProductViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SingleProductController productController = Get.find();

    return Scaffold(
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
                        color: Appcolors.appPink,
                        spreadRadius: 0,
                        blurRadius: 10),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.7,
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
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          productController.singleProd.value.title.toString(),
                        ),
                        Text(
                          productController.singleProd.value.price.toString(),
                        )
                      ],
                    ),
                    const Text("Category"),
                    const Text(
                        "Description:Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma – which is living with the results of other people’s thinking")
                  ],
                ),
              ),
            ],
          );
        }
      })),
    );
  }
}
