import 'package:flutter/material.dart';
import 'package:sample_project/models/cart_model.dart';
import 'package:sample_project/models/products_model.dart';
import 'package:sample_project/providers/cart_provider.dart';

import 'package:get/get.dart';
import 'package:sample_project/repository/products_repository.dart';

enum PageStatus { loading, error, success, none }

class CartController extends GetxController {
  late final CartProvider cartProvider;

  CartController({required this.cartProvider, required this.productRepository});
  ProductRepository productRepository;

  final cartList = RxList<CartModel>();

  final productCartListof = RxList<dynamic>();

  var productCartList = RxList<ProductsModel>();

  // Map<String, dynamic> quantity;

  // var categorymodel = Rx<CategoryModel>(CategoryModel());

  @override
  void onInit() {
    getCartLists();
    super.onInit();
  }

  var isLoading = true.obs;
  // final pageStatus = PageStatus.none.obs;
  String? errorMessage;
  String? ID = "1";
  List<int?> productIds = [];
  // List<ProductsModel> ProductsList = Pr;
  var totalAmount = 0.0.obs;

  Future<void> getCartLists() async {
    try {
      isLoading(true);
      errorMessage = null;
      // pageStatus.value = PageStatus.loading;
      final cartDetail = await cartProvider.getCartDetails();
      cartList.value = cartDetail;

      //   var prodList = productRepository.saveProductQuantityList(cartList);

      // List<Product> products;
      // products.add(cartDetail.);

      for (var item in cartList) {
        print("For loop");
        print(item.date);
        for (var prod in item.products) {
          print("For prod loop:prod ID");
          print(prod.productId);
          productIds.add(prod.productId);
        }
        print("out frst loop");
      }

      final prodList = productRepository.cartItems(productIds);
      List<ProductsModel>? ress = await prodList;

      productCartList.value = ress;
      print("cart product value");
      print(productCartList.value.first);

      double totalAmounts = 0;
      for (var item in productCartList.value) {
        totalAmounts += item.price!;
        totalAmount.value = totalAmounts;
        print(totalAmounts);
      }
      print("Total amount");
      print(totalAmount.value);
      // final prodList =
      //     (await cartProvider.getSingleProductDetail(productIds.first));
      // print("out 2 loop prod list");
      // print(prodList.toString());

      // for (var item in productIds) {
      //   final sample = (await cartProvider.getSingleProductDetail(ID));
      // }

      // productCartListof.value = cartList;
      // print("cart product value");
      // print(productCartListof.value.length);

    }
    //  pageStatus.value = PageStatus.success;
    catch (e) {
      isLoading(false);
      //    pageStatus.value = PageStatus.error;
      errorMessage = e.toString();
    }
  }
}
