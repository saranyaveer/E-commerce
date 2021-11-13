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

  final cartList = RxList<CartModel>([]);
  final productCartitems = Rx<List<CartModel>>([]);

  final productCartListof = RxList<dynamic>();

  var productCartList = RxList<ProductsModel>();
  var quantitySum = 0.obs;

  @override
  void onInit() {
    getCartLists();
    super.onInit();
    productCartitems.obs;
    // cartLists = cartList.value;
    //  quantitySum;
  }

  var isLoading = true.obs;
  // final pageStatus = PageStatus.none.obs;
  String? errorMessage;
  String? ID = "1";
  List<int?> productIds = [];

  var totalAmount = 0.0.obs;

  Future<void> getCartLists() async {
    try {
      isLoading(true);
      errorMessage = null;
      // pageStatus.value = PageStatus.loading;
      final cartDetail = await cartProvider.getCartDetails();
      cartList.value = cartDetail;
      productCartitems.value = cartDetail;

      //   var prodList = productRepository.saveProductQuantityList(cartList);

      // List<Product> products;
      // products.add(cartDetail.);

      for (var item in cartList) {
        for (var prod in item.products) {
          productIds.add(prod.productId);
        }
      }

      final prodList = productRepository.cartItems(productIds);
      List<ProductsModel>? ress = await prodList;

      productCartList.value = ress;

      double totalAmounts = 0;
      for (var item in ress) {
        for (var items in productCartitems.value) {
          for (var prod in items.products) {
            if (item.id == prod.productId) {
              totalAmounts += (item.price! * prod.quantity);
              totalAmount.value = totalAmounts;
            }
          }
        }
        // totalAmounts += (item.price!);
        // totalAmount.value = totalAmounts;
      }

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

    } catch (e) {
      isLoading(false);
      errorMessage = e.toString();
    }
  }
}
