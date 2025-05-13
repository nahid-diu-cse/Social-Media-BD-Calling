import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/view/authentication_view/logIn_view/view/login_view.dart';
import 'package:social_media/view/welcome_view/welcome_screen.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs; // Observable variable for current page
  final PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    // Initialize any late variables if needed
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < pageController.page!.round()) {
      return; // Prevent manual next if already on the last page
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void skip() {
    Get.offAll(WelcomeScreen()); // Navigate to signup instead of home
  }
}