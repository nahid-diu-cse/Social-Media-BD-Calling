import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/view/onBoarding_view/view/onBoaring_view.dart';

import '../../view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  SplashServices splashServices=SplashServices();

  @override
  void initState() {
    super.initState();

    splashServices.isLogin();
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