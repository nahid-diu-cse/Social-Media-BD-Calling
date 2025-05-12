import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';

import '../../../res/appColors/app_colors.dart';
import '../../../res/commonWidget/customText.dart';

class MPProductView extends StatelessWidget {
  const MPProductView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Image.asset(
              AppImages.mpview, // Replace with your asset
              width: double.infinity,
              height: 200.h,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),

                  // Product title and price
                  CustomText(
                    title: 'Iphone 13 Pro Max',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  CustomText(
                    title: '\$12,000',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xff3B3B3B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Description
                  CustomText(
                    title: 'Description',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColorSecondary,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  CustomText(
                    title:
                        'Get active on your off days and challenge your friends by taking the most steps on Saturday and Sunday! Let’s go!',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.gray600,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  InkWell(
                    onTap: () {},
                    child: CustomText(
                      title: 'Read more',
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Details
                  Divider(thickness: 1, height: 1, color: AppColors.gray100),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        CustomText(
                          title: 'Details',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        CustomText(
                          title: 'Used - like new',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1, height: 1, color: AppColors.gray100),

                  // Seller Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: 'Seller Information',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2D3142),
                        ),
                      ),
                      CustomText(
                        title: 'Seller details',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24.r,
                        backgroundImage: AssetImage(
                          AppImages.profile,
                        ), // Replace with your asset
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: CustomText(
                          title: 'Istiak Ahmed',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: CustomText(title: 'Message',style: TextStyle(color: AppColors.whiteColor),),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  // Location
                  CustomText(
                    title: 'Location',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  Container(
                    height: height * .25,
                    width: width,
                    decoration: BoxDecoration(
                      color: AppColors.gray600,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(height: 20.h), // Extra padding at bottom
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
