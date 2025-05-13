import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/appColors/app_colors.dart';
import '../../res/appImage/App_images.dart';
import '../../res/commonWidget/customText.dart';
import '../../res/commonWidget/custom_app_bar.dart';
import '../new_post_view/clips_gallery_view.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Add Post",
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CustomText(
              title: "Post",
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.mainColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Divider(),
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Image.asset(AppImages.add),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ClipsGalleryView());
                    },
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset(AppImages.willpost),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  hintText: "Write post description...",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}