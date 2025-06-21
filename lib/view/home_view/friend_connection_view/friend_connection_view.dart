import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/view/home_view/friend_connection_view/widget/friend_view_card.dart';
import 'package:social_media/view_model/controller/connection_controller/connections_controller.dart';

class FriendConnectionView extends StatefulWidget {
  const FriendConnectionView({super.key});

  @override
  State<FriendConnectionView> createState() => _FriendConnectionViewState();
}

class _FriendConnectionViewState extends State<FriendConnectionView> {
  ConnectionsController connectionsController = Get.put(
    ConnectionsController(),
  );

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
        child: Obx(() {
          final data = connectionsController.myConnectionData.value.data;
          // If data is null or empty, show centered message
          if (data == null || data.isEmpty) {
            return const Center(
              child: CustomText(
                title: "No connection were found!........",
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            );
          }
          // If data has items, show the list
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Friend requests ",
                            style: TextStyle(
                              color: AppColors.black33,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text:
                                "${connectionsController.myConnectionData.value.data!.length}",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: FriendViewCard(),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
