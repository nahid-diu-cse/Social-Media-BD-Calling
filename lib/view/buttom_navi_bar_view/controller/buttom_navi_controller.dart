import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  var selectedIndex = 0.obs;

  /// observable variable

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}