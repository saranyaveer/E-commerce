import 'package:get/get.dart';
import 'package:sample_project/screens/Bottom_navigation_bar/bottomBarBinding.dart';
import 'package:sample_project/screens/Bottom_navigation_bar/bottomNavigationBar.dart';
import 'package:sample_project/screens/FavouritesListPage/FavouritesPage.dart';
import 'package:sample_project/screens/Home/HomePage.dart';
import 'package:sample_project/screens/ProductListPage/ProductView/ProductListPage.dart';
import 'package:sample_project/screens/ProductListPage/ProductView/SingleProductViewPage.dart';
import 'package:sample_project/screens/ProductListPage/product_binding.dart';
import 'package:sample_project/screens/cart/cart.dart';
import 'package:sample_project/screens/cart/cart_binding.dart';
import 'package:sample_project/screens/login/login.dart';
import 'package:sample_project/screens/login/login_binding.dart';

class Routes {
  static final routes = [
    GetPage(name: '/home', page: () => const HomePage()),
    GetPage(
      name: '/productlistpage',
      page: () => const CookiePage(),
      binding: UserListBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => MyLogIn(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/singleproductlistpage',
      page: () => const SingleProductViewPage(),
      binding: UserListBinding(),
    ),
    GetPage(
      name: '/bottombar',
      page: () => BottomNavigatorWidget(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: '/cart',
      page: () => CartPage(),
      binding: CartBinding(),
    ),
    GetPage(
      name: '/fav',
      page: () => const FavouritesPage(),
      binding: UserListBinding(),
    ),
  ];
}
