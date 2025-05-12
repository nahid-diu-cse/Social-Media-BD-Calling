import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/view/community_view/community_add_post_view.dart';

import '../../res/appColors/app_colors.dart';
import '../../res/appImage/App_images.dart';
import '../../res/commonWidget/customText.dart';

class CommunityRecentPost extends StatefulWidget {
  const CommunityRecentPost({super.key});

  @override
  State<CommunityRecentPost> createState() => _CommunityRecentPostState();
}

class _CommunityRecentPostState extends State<CommunityRecentPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Recent Posts",
        actions: [
          InkWell(
            onTap: (){},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Icon(Icons.search, size: 24.sp),
            ),
          ),
          InkWell(
            onTap: (){
              Get.to(()=>CommunityAddPostView());
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
      body: Column(
        children: [
          SizedBox(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(AppImages.alishadoe),
                  ),
                  title: CustomText(
                    title: "Alisha Doe",
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                  subtitle: Row(
                    children: [Text("Los Angles,CA "), Text(".20h ago")],
                  ),
                  trailing: Container(
                    height: 30,
                    width: 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF4F5FA),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 15,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(width: 5),
                          CustomText(
                            title: "Follow",
                            color: AppColors.mainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Column(
                    children: [
                      CustomText(
                        title:
                        "Community connections are very important \nand this platform has all for it.",
                        maxLines: 2,
                        fontSize: 17,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 5),
                      Image.asset(
                        AppImages.dog,
                        height: 220,
                        width: 315,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              AppImages.favorite,
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(width: 3),
                            CustomText(
                              title: "12k",
                              fontSize: 14,
                              color: AppColors.black100,
                            ),
                            Image.asset(AppImages.sms, height: 20, width: 20),
                            SizedBox(width: 3),
                            CustomText(
                              title: "10k",
                              fontSize: 14,
                              color: AppColors.black100,
                            ),
                            Image.asset(
                              AppImages.refresh,
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(width: 3),
                            CustomText(
                              title: "122",
                              fontSize: 14,
                              color: AppColors.black100,
                            ),
                            Image.asset(
                              AppImages.book,
                              height: 20,
                              width: 20,
                            ),
                            Image.asset(
                              AppImages.share,
                              height: 20,
                              width: 20,
                            ),
                            Image.asset(AppImages.dot, height: 20, width: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          _customDivider(),
          SizedBox(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(AppImages.alishadoe),
                  ),
                  title: CustomText(
                    title: "John Doe",
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                  subtitle: Row(
                    children: [Text("Los Angles,CA "), Text(".20h ago")],
                  ),
                  trailing: Container(
                    height: 30,
                    width: 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF4F5FA),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 15,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(width: 5),
                          CustomText(
                            title: "Follow",
                            color: AppColors.mainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Column(
                    children: [
                      CustomText(
                        title:
                        "Lorem ipsum dolor sit amet. Ut molestiaetio in dignissimos et iste dicta aut dolores veniam At one maxime fugiat. Ut internos toquiered consequatur in omnis of esse sed tempore odit ut optio enim!",
                        maxLines: 4,
                        fontSize: 17,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              AppImages.favorite,
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(width: 3),
                            CustomText(
                              title: "12k",
                              fontSize: 14,
                              color: AppColors.black100,
                            ),
                            Image.asset(AppImages.sms, height: 20, width: 20),
                            SizedBox(width: 3),
                            CustomText(
                              title: "10k",
                              fontSize: 14,
                              color: AppColors.black100,
                            ),
                            Image.asset(
                              AppImages.refresh,
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(width: 3),
                            CustomText(
                              title: "122",
                              fontSize: 14,
                              color: AppColors.black100,
                            ),
                            Image.asset(
                              AppImages.book,
                              height: 20,
                              width: 20,
                            ),
                            Image.asset(
                              AppImages.share,
                              height: 20,
                              width: 20,
                            ),
                            Image.asset(AppImages.dot, height: 20, width: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
