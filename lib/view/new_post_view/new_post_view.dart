import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/res/commonWidget/custom_text_field.dart';
import 'package:social_media/res/commonWidget/customText.dart';

class NewPostView extends StatefulWidget {
  const NewPostView({super.key});

  @override
  State<NewPostView> createState() => _NewPostViewState();
}

class _NewPostViewState extends State<NewPostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios)),
                  CustomText(
                    title: "New Post",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    title: "Post",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.mainColor,
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 8),
              Row(
                children: [
                  CircleAvatar(backgroundImage: AssetImage(AppImages.istiak)),
                  SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                     decoration: InputDecoration(
                       hintText: "Write post description...",
                     ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
