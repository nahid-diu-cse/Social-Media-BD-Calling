import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/commonWidget/custom_container_text_card.dart';
import 'package:social_media/res/commonWidget/custom_text_field.dart';
import 'package:social_media/res/customStyle/customText.dart';

class MemberView extends StatefulWidget {
  const MemberView({super.key});

  @override
  State<MemberView> createState() => _MemberViewState();
}

class _MemberViewState extends State<MemberView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Members",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              SizedBox(
                height: 36,
                child: CustomTextField(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search friends",
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(AppImages.image9),
                      ),
                      SizedBox(width: 10),
                      CustomText(
                        title: "Istiak Ahmed",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),

                  CustomContainerTextCard(
                    text: "Admin",
                    cardColor: Colors.grey.shade200,
                    textColor: AppColors.mainColor,
                  ),
                ],
              ),
              Divider(),

              ListView.builder(
                itemCount: 9,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(AppImages.image9),
                          ),
                          SizedBox(width: 10),
                          CustomText(
                            title: "Istiak Ahmed",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Divider(),
                    ],
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
