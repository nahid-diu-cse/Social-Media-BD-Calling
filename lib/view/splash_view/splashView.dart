import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/view/onBoarding_view/view/onBoaring_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Navigate to OnboardingScreen after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
     Get.offAll(()=>OnBoardingView());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200.h,
                width: 200.w,
                child: Image.asset(
                  AppImages.splashBg,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20.h),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}