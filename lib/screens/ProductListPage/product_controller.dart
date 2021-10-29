import 'package:sample_project/models/category_model.dart';
import 'package:sample_project/models/products_model.dart';
import 'package:sample_project/models/user_model.dart';
import 'package:sample_project/providers/products_provider.dart';

import 'package:get/get.dart';
import 'package:sample_project/repository/products_repository.dart';
import 'package:sample_project/services/storage_service.dart';

enum PageStatus { loading, error, success, none }

class ProductController extends GetxController {
  late final ProductsProvider productsProvider;

  ProductController(
      {required this.productsProvider, required this.productRepository});

  ProductRepository productRepository;
  var selectedIndex = 1.obs;
  Rating? prodList = Rating();
  final produList = RxList<ProductsModel>();
  final produListFromStorage = RxList<ProductsModel>();

  final categoriesListRX = RxList<dynamic>();
  final singleProductDetails = RxList<ProductsModel>();
  final userList = RxList<UserModel>();
  var singleUser = Rx<UserModel>(UserModel());
  int? userId;

  final loggedInuserId = StorageService().getUserName('username');

  @override
  void onInit() {
    getMoviessLists();
    getCategoryLists();
    // getProductCategories(categoryParams: 'electronics');
    super.onInit();
  }

  var isLoading = true.obs;
  final pageStatus = PageStatus.none.obs;
  String? errorMessage;
  // var categorymodel = Rx<CategoryModel>(CategoryModel());
  final prod = RxList<Future<ProductsModel>>();
  String? ID = "0";
  var singleProd = Rx<ProductsModel>(ProductsModel());
  var categoryProduct = Rx<List<ProductsModel>>([]);

  Future<void> getMoviessLists() async {
    try {
      isLoading(true);

      errorMessage = null;
      pageStatus.value = PageStatus.loading;
      final productList = await productsProvider.getProdList();
      produList.value = productList;
      pageStatus.value = PageStatus.success;
    } catch (e) {
      isLoading(false);
      pageStatus.value = PageStatus.error;
      errorMessage = e.toString();
    }
  }

  //To fetch the list of category
  void getCategoryLists() async {
    print("Inside Category");
    try {
      print("Inside try");

      isLoading(true);
      errorMessage = null;
      pageStatus.value = PageStatus.loading;
      final categoryList = await productsProvider.getCategoriesList();
      categoryList.add("All");
      categoriesListRX.value = categoryList;

      pageStatus.value = PageStatus.success;
    } catch (e) {
      isLoading(false);
      pageStatus.value = PageStatus.error;
      errorMessage = e.toString();
    }
  }

  //To fetch the single product while clicking the grid
  Future<void> getSingleProduct(String? id) async {
    ID = id;
    try {
      isLoading(true);
      print("isloading in sing prod");
      errorMessage = null;
      pageStatus.value = PageStatus.loading;
      final singleproductList =
          await productsProvider.getSingleProductDetail(id!);
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

  void getProductListStorage() async {
    try {
      isLoading(true);

      errorMessage = null;
      pageStatus.value = PageStatus.loading;
      final productList = await productRepository.getEmpList();
      produListFromStorage.value = productList;
      print("productList nnnnnn");
      print(produListFromStorage.value.first);
      pageStatus.value = PageStatus.success;
    } catch (e) {
      isLoading(false);
      pageStatus.value = PageStatus.error;
      errorMessage = e.toString();
    }
  }

  void getProductCategories({required String categoryParams}) async {
    try {
      print("inside prod category");

      errorMessage = null;

      pageStatus.value = PageStatus.loading;

      final productCategoryResponse =
          await productsProvider.getProductsCategories(params: categoryParams);
      // proudctModel = productCategoryResponse as Rx<List<ProductsModel>>;
      //print(proudctModel);

      produList.value = productCategoryResponse as List<ProductsModel>;

      pageStatus.value = PageStatus.success;
    } catch (e) {
      isLoading(false);
      pageStatus(PageStatus.error);
      errorMessage = e.toString();
    }
  }

  Future<void> getUsersLists() async {
    try {
      isLoading(true);
      errorMessage = null;
      final userLists = await productsProvider.getUserList();
      print("list from API");
      print(userLists.length);
      userList.value = userLists;
      print(userList.value.first);

      for (var item in userLists) {
        if (item.username == loggedInuserId) {
          userId = item.id;
        }
      }
      final singleproductList =
          await productsProvider.getSingleUserDetail(userId!.toString());
      singleUser.value = singleproductList;
    } catch (e) {
      isLoading(false);
      errorMessage = e.toString();
    }
  }
}
