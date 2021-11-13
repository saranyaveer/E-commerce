import 'package:sample_project/models/favouiteModel.dart';
import 'package:sample_project/models/products_model.dart';
import 'package:sample_project/models/user_model.dart';
import 'package:sample_project/providers/products_provider.dart';

import 'package:get/get.dart';
import 'package:sample_project/repository/favouriteRepository.dart';
import 'package:sample_project/repository/products_repository.dart';
import 'package:sample_project/services/storage_service.dart';

enum PageStatus { loading, error, success, none }

class ProductController extends GetxController {
  late final ProductsProvider productsProvider;

  ProductController(
      {required this.productsProvider,
      required this.productRepository,
      required this.favoritesRepository});

  ProductRepository productRepository;
  FavoritesRepository favoritesRepository;
  var selectedIndex = 1.obs;
  Rating? prodList = Rating();
  final produList = RxList<ProductsModel>();
  final produListFromStorage = RxList<ProductsModel>();
  final produFavList = RxList<ProductsModel>();
  final searchText = "".obs;
  //final favListIcon = RxList<FavoritesModel>();
  final favListIcon = RxList<ProductsModel>();

  final categoriesListRX = RxList<dynamic>();
  final singleProductDetails = RxList<ProductsModel>();
  final userList = RxList<UserModel>();
  var singleUser = Rx<UserModel>(UserModel());
  int? userId;
  var isFavourite = false.obs;
  List<ProductsModel> searchproductsmodel = [];
  // List<ProductsModel> favList = [].obs as List<ProductsModel>;
  var favList = Rx<ProductsModel>(ProductsModel());
  final favouriteList = RxList<ProductsModel>();
  var favIconList = [].obs;
  var favlist = RxList<int?>();

  final loggedInuserId = StorageService().getUserName('username');

  @override
  void onInit() async {
    super.onInit();
    getMoviessLists();
    getCategoryLists();
    getProductsForSearchData();
    //  getFavouriteListCart();
    //  getfavIconList();
//     var favList = await FavoritesDaoClass().getFavourites();
// selectedFavoriteProduct.value = favList;
    var list = await productRepository.getFavouriteList1();
    favIconList.value = list;
    // var list = await favoritesRepository.getFavourites();
    // favIconList.value = list;
    // isFavourite = false.obs;
  }

  var isLoading = true.obs;
  final pageStatus = PageStatus.none.obs;
  String? errorMessage;
  // var categorymodel = Rx<CategoryModel>(CategoryModel());
  final prod = RxList<Future<ProductsModel>>();
  String? ID = "0";
  var singleProd = Rx<ProductsModel>(ProductsModel());
  var categoryProduct = Rx<List<ProductsModel>>([]);

  // void getFavouriteListCart() async {
  //   try {
  //     isLoading(true);
  //     errorMessage = null;
  //      final results = // favoritesRepository.getFavourites();
  //     productRepository.getFavouriteList();
  //      favListIcon.value = results ;
  //     //final items = results as List<int>;

  //     // final prodList = await productRepository.cartItems(items);
  //     // produFavList.value = prodList;

  //     // for (var item in items) {
  //     //   // var itemss = item
  //     //   // getSingleProduct()
  //     // }
  //   } catch (e) {
  //     isLoading(false);
  //     pageStatus.value = PageStatus.error;
  //     errorMessage = e.toString();
  //   }
  // }

  // Future<void> getfavIconList() async {
  //   try {
  //     isLoading(true);

  //     errorMessage = null;
  //     pageStatus.value = PageStatus.loading;
  //     var list = await favoritesRepository.getFavourites();
  //     favlist.value = list.cast<int?>();
  //     //List<int?> list = favIconList as List<int?>;
  //     final productFavList =
  //         await productRepository.cartItems(list.cast<int?>());
  //     produFavList.value = productFavList;

  //     pageStatus.value = PageStatus.success;
  //   } catch (e) {
  //     isLoading(false);
  //     pageStatus.value = PageStatus.error;
  //     errorMessage = e.toString();
  //   }
  // }

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

  void getProductsForSearchData() async {
    try {
      errorMessage = null;

      final results = productRepository.getEmpList();

      List<ProductsModel>? ress = await results;

      for (var item in ress) {
        searchproductsmodel.add(item);
      }
      // produList.value = ress;
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  void getSearchData(String searchtxt) {
    try {
      isLoading(true);
      errorMessage = null;
      if (searchtxt.isEmpty) {
        produList.value = searchproductsmodel;
      } else {
        var model = searchproductsmodel
            .where((user) =>
                user.title!.toLowerCase().contains(searchtxt.toLowerCase()))
            .toList();

        produList.value = model;
      }
    } catch (e) {
      isLoading(false);
      pageStatus.value = PageStatus.error;
      errorMessage = e.toString();
    }
  }

  //To fetch the list of category
  void getCategoryLists() async {
    try {
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
      errorMessage = null;
      pageStatus.value = PageStatus.loading;
      final singleproductList =
          await productsProvider.getSingleProductDetail(id!);

      singleProd.value = singleproductList;
      pageStatus.value = PageStatus.success;
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

      pageStatus.value = PageStatus.success;
    } catch (e) {
      isLoading(false);
      pageStatus.value = PageStatus.error;
      errorMessage = e.toString();
    }
  }

  void getProductCategories({required String categoryParams}) async {
    try {
      errorMessage = null;

      pageStatus.value = PageStatus.loading;

      final productCategoryResponse =
          await productsProvider.getProductsCategories(params: categoryParams);
      // proudctModel = productCategoryResponse as Rx<List<ProductsModel>>;
      //print(proudctModel);

      produList.value = productCategoryResponse;

      pageStatus.value = PageStatus.success;
    } catch (e) {
      isLoading(false);
      pageStatus(PageStatus.error);
      errorMessage = e.toString();
    }
  }

  Future<void> addFavouriteProduct(int id) async {
    try {
      isLoading(true);
      errorMessage = null;
      final favproductList = await productRepository.saveFavourite(id);
      // productRepository.saveProductList(favproductList);

      // favList.value = favproductList;
      // final results = productRepository.getFavouriteList();

      // final localstrorageFavItems = await productRepository.saveFavourite(id);

      // // favIconList.add(localstrorageFavItems);

      // List<ProductsModel> ress = await results;
      // favouriteList.value = ress;
    } catch (e) {
      isLoading(false);
      errorMessage = e.toString();
    }
  }

  void removeFavProduct(int id) async {
    try {
      isLoading(true);
      errorMessage = null;
      final favproductList = await productRepository.deleteFavProductList(id);
      // productRepository.deleteFavProductList(id);
      // errorMessage = null;

      // final results = productRepository.getFavouriteList();

      // List<ProductsModel> ress = await results;
      // favouriteList.value = ress;
    } catch (e) {
      isLoading(false);
      errorMessage = e.toString();
    }
  }

  void getFavProducts() {}

  Future<void> getUsersLists() async {
    try {
      isLoading(true);
      errorMessage = null;
      final userLists = await productsProvider.getUserList();

      userList.value = userLists;

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
