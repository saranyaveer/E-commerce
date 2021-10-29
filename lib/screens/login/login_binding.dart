import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sample_project/providers/login_provider.dart';
import 'package:sample_project/screens/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(
      loginProvider: LoginProvider(client: Client()),
    ));
  }
}
