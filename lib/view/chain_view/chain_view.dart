import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/view/chain_view/create_chain_view.dart';
import 'package:social_media/view/chain_view/search_chain_network_view.dart';
import 'package:social_media/view/chain_view/trending_view.dart';
import 'package:social_media/view/chain_view/widget/chain_map_widget.dart';

class ChainView extends StatefulWidget {
  const ChainView({super.key});

  @override
  State<ChainView> createState() => _ChainViewState();
}

class _ChainViewState extends State<ChainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: BoxDecoration(color: AppColors.bgColor),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            title: "My Network Chain",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down, size: 23.sp),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.gray50.withOpacity(0.05),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                AppImages.message,
                                height: 18.w,
                                width: 18.w,
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.gray50.withOpacity(0.05),
                            ),
                            child: IconButton(
                              onPressed: () {
                                _showBottomSheet(context);
                              },
                              icon: Image.asset(
                                AppImages.plus,
                                height: 22.w,
                                width: 22.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    // Enable horizontal scrolling
                    child: Row(
                      children: [
                        _buildRoundedTextButton("People", () {}),
                        SizedBox(width: 10.w),
                        _buildRoundedTextButton("Industry", () {}),
                        SizedBox(width: 10.w),
                        _buildRoundedTextButton("Location", () {}),
                        SizedBox(width: 10.w),
                        _buildRoundedTextButton("School", () {}),
                        SizedBox(width: 10.w),
                        _buildRoundedTextButton("Invite", () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ChainMapView(),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder:
          (_) => Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(CreateChainView());
                    },
                    child: Row(
                      children: [
                        Image.asset(AppImages.plus, height: 24, width: 24),
                        SizedBox(width: 8.0),
                        CustomText(
                          title: 'Create New Chain',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(SearchChainNetworkView());
                    },
                    child: Row(
                      children: [
                        Image.asset(AppImages.search, height: 24, width: 24),
                        SizedBox(width: 8.0),
                        CustomText(
                          title: 'Search Chain Networks',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(TrendingView());
                    },
                    child: Row(
                      children: [
                        Image.asset(AppImages.account, height: 24, width: 24),
                        SizedBox(width: 8.0),
                        CustomText(
                          title: 'Invite people to chain',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
    );
  }

  Widget _buildRoundedTextButton(String title, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
        side: BorderSide(color: Color(0xffE6EAFE)),
        backgroundColor: Color(0xffF8F9FB),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.gray600,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
