import 'package:sample_project/models/login_model.dart';
import 'package:sample_project/models/user_model.dart';
import 'package:sample_project/providers/login_provider.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  late final LoginProvider loginProvider;

  LoginController({required this.loginProvider});

  LoginModel? loginId = LoginModel();
  // String username;
  // String password;

  // RxList<ProductsModel> myList = <ProductsModel>[].obs;
  var userDetail = Rx<UserModel>(UserModel());

  @override
  void onInit() {
    getLoginToken(userName, passWord);
    super.onInit();
  }

  var isLoading = true.obs;
  String? errorMessage;
  // LoginModel? loginToken;
  final loginToken = LoginModel().obs;
  final userList = RxList<UserModel>();
  var singleUser = Rx<UserModel>(UserModel());

  int? userId;
  String? id = "0";

  var userName = "d";
  var passWord = "d";

  Future<void> getLoginToken(username, password) async {
    userName = username;
    passWord = password;
    try {
      isLoading(true);
      errorMessage = null;
      final loginDetail = await loginProvider.getLoginToken(username, password);
      loginToken.value = loginDetail;
    } catch (e) {
      isLoading(false);
      errorMessage = e.toString();
    }
  }

  Future<void> getUsersLists() async {
    try {
      isLoading(true);
      errorMessage = null;
      final userLists = await loginProvider.getUserList();

      userList.value = userLists;

      for (var item in userLists) {
        if (item.username == userName) {
          userId = item.id;
        }
      }
      final singleproductList = await loginProvider.getSingleUserDetail(id!);
      singleUser.value = singleproductList;
    } catch (e) {
      isLoading(false);
      errorMessage = e.toString();
    }
  }
}
