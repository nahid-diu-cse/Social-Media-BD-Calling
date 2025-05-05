import 'package:flutter/material.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/customStyle/customText.dart';

class MessagesChatView extends StatelessWidget {
  const MessagesChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back_ios),
                      CircleAvatar(
                        backgroundImage: AssetImage(AppImages.hanna),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: 'Hanna Levin',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          CustomText(
                            title: 'hennyjen',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(AppImages.video, width: 24, height: 24),
                      SizedBox(width: 15),
                      Image.asset(AppImages.call, width: 24, height: 24),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 52,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock),
                      CustomText(title: "End to end encrypted"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
