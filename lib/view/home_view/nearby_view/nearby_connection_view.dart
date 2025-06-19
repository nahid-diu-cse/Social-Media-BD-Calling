import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/view/home_view/nearby_view/widget/nc_widget.dart';

import '../../../res/appColors/app_colors.dart';
import '../../../res/appImage/App_images.dart';
import '../friend_connection_view/widget/friend_view_card.dart';

class NearbyView extends StatelessWidget {
  NearbyView({super.key});

  List friendRequests = [
    {
      'name': 'Istiak Ahmed',
      'mutual': '6 mutule friends',
      'time': '5d',
      'image': AppImages.istiak,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Connections",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios, size: 15.sp),
          onTap: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "People you may know",
                  style: TextStyle(
                    color: AppColors.black33,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: NcWidget(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
