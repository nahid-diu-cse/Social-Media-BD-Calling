import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/view/community_view/community_upcoming_events/create_upcoming_events.dart';
import '../../../res/appImage/App_images.dart';
import '../../../res/commonWidget/customText.dart';

class CommunityUpcomingEvents extends StatelessWidget {
  const CommunityUpcomingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> events = [
      {
        'title': 'National health movement',
        'description': 'Challenge your friends by taking the most steps\non Saturday and Sunday!',
        'location': '10 The Embarcadero, San Francisco',
        'date': 'SAT 10 FEB',
        'time': '8:00 AM',
      },
      {
        'title': 'National health movement',
        'description': 'Challenge your friends by taking the most steps\non Saturday and Sunday!',
        'location': '36 Guild Street London, England',
        'date': 'WED 26 FEB',
        'time': '8:00 PM',
      },
      {
        'title': 'National health movement',
        'description': 'Challenge your friends by taking the most steps\non Saturday and Sunday!',
        'location': '36 Guild Street London, England',
        'date': 'FRI 28 FEB',
        'time': '9:00 AM',
      },
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: "Events",
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Icon(Icons.search, size: 24.sp),
          ),
          InkWell(
            onTap: (){
              Get.to(()=>CreateUpcomingEvents());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Image.asset(
                AppImages.plus,
                width: 24.w,
                height: 24.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: AppColors.gray50),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: '03 Upcoming Events',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: events.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return Card(
                      elevation: 1,
                      color: AppColors.whiteColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_month, color: AppColors.mainColor),
                                SizedBox(width: 5.w),
                                CustomText(
                                  title: event['date']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: AppColors.mainColor,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                CustomText(
                                  title: event['time']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: AppColors.mainColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.w),
                            CustomText(
                              title: event['title']!,
                              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            CustomText(
                              title: event['description']!,
                              fontSize: 14,
                              color: Color(0xff4C5980),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                                SizedBox(width: 4.w),
                                CustomText(
                                  title: event['location']!,
                                  fontSize: 13.sp,
                                  color: AppColors.gray900,
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: List.generate(2, (index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Image.asset(
                                        AppImages.profile,
                                        width: 30.0.w,
                                        height: 30.0.h,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                  decoration: BoxDecoration(color: Color(0xffF2F4FD),borderRadius: BorderRadius.circular(15)),
                                  child: CustomText(
                                    title: 'Interested',
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
