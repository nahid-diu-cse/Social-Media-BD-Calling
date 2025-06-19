import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../res/appColors/app_colors.dart';
import '../../../../res/appImage/App_images.dart';
import '../../../../res/commonWidget/customText.dart';
import '../../../../res/commonWidget/custom_container_text_card.dart';

class NcWidget extends StatelessWidget {
  const NcWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        title: "Istiak Ahmed",
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
                        text: "Add friend",
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
