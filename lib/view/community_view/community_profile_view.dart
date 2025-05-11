import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/view/community_view/community_announcements_view.dart';
import 'package:social_media/view/community_view/community_recent_post.dart';
import 'package:social_media/view/community_view/community_upcoming_events/community_upcoming_events.dart';

import '../../res/appColors/app_colors.dart';
import '../../res/appImage/App_images.dart';

class CommunityProfileView extends StatefulWidget {
  const CommunityProfileView({super.key});

  @override
  State<CommunityProfileView> createState() => _CommunityProfileViewState();
}

class _CommunityProfileViewState extends State<CommunityProfileView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(15),
                child: ListTile(
                  leading: SizedBox(
                    // adjust width to fit both icon and image
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Image.asset(
                          AppImages.profile1,
                          width: 40.w,
                          height: 40.w,
                        ),
                      ],
                    ),
                  ),
                  title: CustomText(
                    title: "BMW M Series",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  subtitle: Row(
                    children: [
                      CustomText(
                        title: "250 Members ·",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      CustomText(
                        title: "Public",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz),
                  ),
                ),
              ),
              Divider(),
              assistTile(
                title: 'Community Rules',
                imagePath: AppImages.book,
                onTap: () {},
              ),
              assistTile(
                title: 'Announcements',
                imagePath: AppImages.microphone,
                onTap: () {
                  Get.to(CommunityAnnouncementsView());
                },
              ),
              assistTile(
                title: 'Upcoming Events',
                imagePath: AppImages.sms,
                onTap: () {
                  Get.to(CommunityUpcomingEvents());
                },
              ),
              assistTile(
                title: 'Recent Posts',
                imagePath: AppImages.listbook,
                onTap: () {
                  Get.to(CommunityRecentPost());
                },
              ),
              assistTile(
                title: 'Popular Discussion',
                imagePath: AppImages.security,
                onTap: () {},
              ),
              assistTile(
                title: 'Marketplace',
                imagePath: AppImages.support,
                onTap: () {},
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget assistTile({
    required String title,
    required String imagePath,
    VoidCallback? onTap,
    Widget? trailing,
    double iconSize = 24,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.asset(imagePath, height: iconSize, width: iconSize),
              title: CustomText(title: title),
              trailing:
                  trailing ??
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15.sp,
                    color: Colors.black,
                  ),
            ),
            Divider(height: 1, thickness:3, color: AppColors.gray100),
          ],
        ),
      ),
    );
  }
}
