import 'package:flutter/material.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/customStyle/customText.dart';

class ClipsGalleryView extends StatefulWidget {
  const ClipsGalleryView({super.key});

  @override
  State<ClipsGalleryView> createState() => _ClipsGalleryViewState();
}

class _ClipsGalleryViewState extends State<ClipsGalleryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios),
                Row(
                  children: [
                    CustomText(
                      title: "Clips",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(width: 5),
                    Image.asset(AppImages.clips,width: 34,height: 34,)
                  ],
                ),
                CustomText(
                  title: "Next",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.mainColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
