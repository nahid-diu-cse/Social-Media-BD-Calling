import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/res/customStyle/customText.dart';
import '../../../res/appColors/app_colors.dart';
import '../controller/on_board_controller.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({super.key});

  final OnboardingController controller = Get.put(OnboardingController());

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Shape Your OneNet Experience',
      'description':
      'Select your interests to personalize your feed and connect with the people and content that matter most to you.',
      'image': 'assets/images/onBoaringOne.png',
    },
    {
      'title': 'Everything You Can Do in the app',
      'description':
      'This app is a digital space where the possibilities are endless! If you want to connect with like-minded people and share your thoughts and ideas, this app has it all.',
      'image': 'assets/images/onBoardingTwo.png',
    },
    {
      'title': 'Find your friends and play together on social media',
      'description':
      'Stay connected like never before! Reunite with old friends, make new ones, and enjoy endless fun together.',
      'image': 'assets/images/onBoardingThree.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [

              // Details of On Boarding Screen
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image
                        Container(
                          height: 200.h, // Reduced height
                          width: 300.w, // Reduced width
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Image.asset(
                            onboardingData[index]['image']!,
                            fit: BoxFit.contain, // Show full image without cropping
                          ),
                        ),
                        SizedBox(height: 40.h),
                        // Title
                        CustomText(
                        title:   onboardingData[index]['title']!,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0XFF5C5C5C),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.h),
                        // Description
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),

                          child: CustomText(
                           title:  onboardingData[index]['description']!,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0XFF5C5C5C),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),


              // Dots Indicator
              Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                        (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      width: controller.currentPage.value == index ? 15.w : 8.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        color: controller.currentPage.value == index
                            ? AppColors.mainColor
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Obx(
                      () => Column(
                    children: [

                      //Button For Next
                      ElevatedButton(

                        onPressed: () {
                          if (controller.currentPage.value ==
                              onboardingData.length - 1) {
                            Get.offAllNamed('/signup');
                          } else {
                            controller.nextPage();
                          }
                        },


                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainColor,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          minimumSize: Size(double.infinity, 0), // Full width
                        ),
                        child: CustomText(
                         title:  controller.currentPage.value ==
                              onboardingData.length - 1
                              ? 'Next'
                              : 'Next',
                         fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFFFAFAFA),
                        ),
                      ),

                      SizedBox(height: 12.h),


                      //Button For Skip
                      OutlinedButton(

                        onPressed: controller.skip,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.darkBlue,
                          side: BorderSide(color: AppColors.mainColor, width: 1.w),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          minimumSize: Size(double.infinity, 0), // Full width
                        ),
                        child: CustomText(
                         title:  'Skip',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF5C5C5C),
                        ),
                      ),

                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),


              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}