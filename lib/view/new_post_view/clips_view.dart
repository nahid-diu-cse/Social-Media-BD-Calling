import 'package:flutter/material.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/customStyle/customText.dart';

class ClipsView extends StatefulWidget {
  const ClipsView({super.key});

  @override
  State<ClipsView> createState() => _ClipsViewState();
}

class _ClipsViewState extends State<ClipsView> {
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
                  Icon(Icons.arrow_back_ios),
                  CustomText(
                    title: "Clips",
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
              SizedBox(height: 10),
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
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset(AppImages.willpost),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  CustomText(
                    title: "What you want to say?",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
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
