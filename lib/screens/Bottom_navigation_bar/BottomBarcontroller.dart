// ignore_for_file: file_names

import 'package:get/get.dart';

class BottomNavigatorController extends GetxController {
  final Rx<int> tabIndex = 0.obs;

  // Rxn<int> tabIndex = Rxn<int>(0);

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }
}
