import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/res/commonWidget/custom_container_text_card.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/view_model/controller/connection_controller/connections_controller.dart';

class FriendViewCard extends StatelessWidget {
  const FriendViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      width: double.infinity,
      child: Row(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(AppImages.istiak),
              ),
            ],
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: "",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(width: 170),
                      CustomText(
                        title: "5d",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomText(
                        title: "6 mutule friends",
                        fontSize: 16,
                        color: AppColors.black100,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomContainerTextCard(
                        text: "Confirm",
                        height: 35,
                        width: 125,
                      ),
                      SizedBox(width: 15),
                      CustomContainerTextCard(
                        text: "Delete",
                        textColor: AppColors.black33,
                        height: 35,
                        width: 125,
                        cardColor: Colors.white,
                        border: Border.all(color: AppColors.black100),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
