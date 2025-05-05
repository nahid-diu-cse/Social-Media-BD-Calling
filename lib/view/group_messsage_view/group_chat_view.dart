import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/commonWidget/custom_container_text_card.dart';
import 'package:social_media/res/commonWidget/custom_text_field.dart';
import 'package:social_media/res/customStyle/customText.dart';

class GroupChatView extends StatefulWidget {
  const GroupChatView({super.key});

  @override
  State<GroupChatView> createState() => _GroupChatViewState();
}

class _GroupChatViewState extends State<GroupChatView> {
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
                      GestureDetector(
                          onTap:(){
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back_ios)),
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
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock, size: 15),
                      SizedBox(width: 5),
                      CustomText(
                        title: "End to end encrypted",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        title:
                        "Messages and calls are secured with end-to-end encryption.",
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  CustomText(title: "Today, 4:27 PM"),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              CustomContainerTextCard(
                                text: "Hey!!",
                                textColor: AppColors.black33,
                                cardColor: Colors.grey.shade200,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(AppImages.hanna),
                              ),
                              SizedBox(width: 20),
                              CustomContainerTextCard(
                                text: "How’s it going?",
                                width: 125,
                                textColor: AppColors.black33,
                                cardColor: Colors.grey.shade200,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          CustomContainerTextCard(
                            text: "All good, wbu?",
                            width: 125,
                            textColor: AppColors.bgColor,
                            cardColor: AppColors.mainColor,
                          ),
                          CustomText(
                            title: "Seen 4:30 PM",
                            color: AppColors.black100,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  CustomText(title: "Today, 8:00 PM"),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 55),
                              CustomContainerTextCard(
                                text: "Not Bad",
                                textColor: AppColors.black33,
                                cardColor: Colors.grey.shade200,
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              SizedBox(width: 55),
                              CustomContainerTextCard(
                                text: "Did you see this?",
                                width: 145,
                                textColor: AppColors.black33,
                                cardColor: Colors.grey.shade200,
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(AppImages.hanna),
                              ),
                              SizedBox(width: 20),
                              Image.asset(AppImages.image8),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 150),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.add, color: Colors.grey),
                      SizedBox(
                        height: 36,
                        child: CustomTextField(
                          width: 275,
                          suffixIcon: Icon(Icons.emoji_emotions),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      Image.asset(AppImages.camera, width: 20, height: 20),
                      Image.asset(AppImages.microphone, width: 20, height: 20),
                    ],
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
