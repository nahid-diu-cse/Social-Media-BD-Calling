import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/view/community_view/marketplace_view/mp_product_category_view.dart';
import 'package:social_media/view/community_view/marketplace_view/mp_product_listing_view.dart';
import 'package:social_media/view/community_view/marketplace_view/mp_product_view.dart';

import '../../../res/appImage/App_images.dart';
import '../../../res/commonWidget/customText.dart';

class MarketplaceView extends StatelessWidget {
  MarketplaceView({super.key});

  final List<Map<String, dynamic>> items = [
    {
      'title': 'Iphone 13 Pro Max',
      'category': 'Mobile Phones',
      'price': 120,
      'image': AppImages.iphone13,
    },
    {
      'title': 'Mercedes W140',
      'category': 'Cars',
      'price': 3000,
      'image': AppImages.marcedes,
    },
    {
      'title': 'Wooden Chair',
      'category': 'Furniture',
      'price': 40,
      'image': AppImages.woodenChair,
    },
    {
      'title': 'Iphone 16',
      'category': 'Mobile Phones',
      'price': 200,
      'image': AppImages.iphone16,
    },
    {
      'title': 'Iphone 13 Pro Max',
      'category': 'Mobile Phones',
      'price': 120,
      'image': AppImages.iphone13,
    },
    {
      'title': 'Mercedes W140',
      'category': 'Cars',
      'price': 3000,
      'image': AppImages.marcedes,
    },
    {
      'title': 'Wooden Chair',
      'category': 'Furniture',
      'price': 40,
      'image': AppImages.woodenChair,
    },
    {
      'title': 'Iphone 16',
      'category': 'Mobile Phones',
      'price': 200,
      'image': AppImages.iphone16,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Marketplace",
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Icon(Icons.search, size: 24.sp),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(MpProductListingView());
            },
            child: Image.asset(
              AppImages.plus,
              width: 24.w,
              height: 24.w,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location and Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue, size: 20.sp),
                      SizedBox(width: 4.w),
                      CustomText(
                        title: "Laguna Beach, CA",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(MpProductCategoryView());
                    },
                    child: Row(
                      children: [
                        Icon(Icons.grid_view_outlined, size: 20.sp),
                        SizedBox(width: 4.w),
                        CustomText(
                          title: "Categories",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),

              // Responsive Grid
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
                    return GridView.builder(
                      itemCount: items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 12.h,
                        childAspectRatio: 0.68,
                      ),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(MPProductView());
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.asset(
                                  item['image'],
                                  width: double.infinity,
                                  height: 120.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              CustomText(
                                title: item['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              CustomText(
                                title: item['category'],
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              CustomText(
                                title: "\$${item['price']}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
