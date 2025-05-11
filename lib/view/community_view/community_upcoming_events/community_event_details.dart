import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';

class CommunityEventDetails extends StatelessWidget {
  const CommunityEventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: height * 0.3,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                AppImages.car,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(height: 10.h),
                CustomText(
                  title: "EVENTS",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: AppColors.mainColor,
                  ),
                ),
                CustomText(
                  title: "BMW Owner Meetup",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                  ),
                ),
                CustomText(
                  title: "by BMW M Series",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: const Color(0xff2d3142),
                  ),
                ),
                SizedBox(height: height * .02),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        title: "Interested",
                        onTap: () {},
                        cardColor: AppColors.gray100,
                        textColor: AppColors.mainColor,
                        prefixIcon: Icon(
                          Icons.star_border,
                          size: 20.sp,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: CustomButton(
                        title: "Shared",
                        onTap: () {},
                        cardColor: AppColors.gray100,
                        textColor: const Color(0xff1d2939),
                        prefixAssetIcon: Image.asset(
                          AppImages.share,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                  ],
                ),
                _customDivider(),
                CustomText(
                  title: "24 people are going",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: const Color(0xff2d3142),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    // Add your user avatars/circles here
                  ],
                ),
                _customDivider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.star_border, size: 20.sp),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: "Thursday, 6 Feb 2020",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: const Color(0xff2d3142),
                          ),
                        ),
                        CustomText(
                          title: "6:30 PM - 7:30 PM",
                          style: TextStyle(
                            color: AppColors.gray500,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        CustomText(
                          title: "Add to calendar",
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.place, size: 20.sp),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: "Commonwealth Club",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: const Color(0xff2d3142),
                          ),
                        ),
                        CustomText(
                          title: "110 The Embarcadero, San Fransisco",
                          style: TextStyle(
                            color: AppColors.gray500,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                _customDivider(),
                CustomText(
                  title: "About",
                  style: TextStyle(
                    color: const Color(0xff2d3142),
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                CustomText(
                  title: "Get active on your off days and challenge your friends by taking the most steps on Saturday and Sunday! Let's go!",
                  style: TextStyle(
                    color: AppColors.gray600,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: CustomText(
                    title: "Read More",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                _customDivider(),
                Container(
                  height: height * .25,
                  width: width,
                  decoration: BoxDecoration(
                    color: AppColors.gray600,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(height: 20.h), // Extra padding at bottom
                )],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Divider(thickness: 1, color: AppColors.gray100),
    );
  }
}