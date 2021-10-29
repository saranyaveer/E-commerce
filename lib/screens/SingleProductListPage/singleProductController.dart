// ignore_for_file: file_names

import 'package:sample_project/models/products_model.dart';
import 'package:sample_project/providers/products_provider.dart';

import 'package:get/get.dart';

enum PageStatus { loading, error, success, none }

class SingleProductController extends GetxController {
  late final ProductsProvider productsProvider;

  SingleProductController({required this.productsProvider});

  // final singleProductDetails

  @override
  void onInit() {
    getSingleProduct(ID);
    super.onInit();
  }

  var isLoading = true.obs;
  final pageStatus = PageStatus.none.obs;
  String? errorMessage;
  final prod = RxList<Future<ProductsModel>>();
  var ID;

  var singleProd = Rx<ProductsModel>(ProductsModel());

  //To fetch the single product while clicking the grid
  Future<void> getSingleProduct(String id) async {
    ID = id;
    try {
      isLoading(true);
      print("isloading in sing prod");
      errorMessage = null;
      pageStatus.value = PageStatus.loading;
      final singleproductList =
          await productsProvider.getSingleProductDetail(id);
      print("singleproductList");
      //print(singleproductList.length);
      //  singleProductDetails.value = singleproductList;
      print("singleproductList.value");
      // print(singleProductDetails.value.first.description);
      singleProd.value = singleproductList;
      pageStatus.value = PageStatus.success;
      print("Success in ding pro");
    } catch (e) {
      isLoading(false);
      pageStatus.value = PageStatus.error;
      errorMessage = e.toString();
    }
  }
}
