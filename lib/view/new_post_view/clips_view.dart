import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/view/new_post_view/clips_gallery_view.dart';

class ClipsView extends StatefulWidget {
  const ClipsView({super.key});

  @override
  State<ClipsView> createState() => _ClipsViewState();
}

class _ClipsViewState extends State<ClipsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Clips",
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
