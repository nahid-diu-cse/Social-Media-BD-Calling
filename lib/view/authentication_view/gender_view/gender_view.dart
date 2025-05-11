import 'package:flutter/material.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/customText.dart';

class GenderView extends StatefulWidget {
  const GenderView({super.key});

  @override
  State<GenderView> createState() => _GenderViewState();
}

class _GenderViewState extends State<GenderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios_rounded)),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  title: "What gender are you?",
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ],
            ),
            SizedBox(height: 15),
            CustomText(
              title:
                  "Your gender information will be updated on your profile page and this will displayed publicly on your dashboard.",
              fontSize: 15,
              textAlign: TextAlign.center,
              color: AppColors.black100,
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: "Female",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      Icon(
                        Icons.circle_outlined,
                        color: AppColors.black100,
                        size: 20,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: "Male",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      Icon(
                        Icons.circle_outlined,
                        color: AppColors.black100,
                        size: 20,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: "Custom",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      Icon(
                        Icons.circle_outlined,
                        color: AppColors.black100,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            CustomButton(title: "Continue",
                fontSize: 15,
                fontWeight: FontWeight.w500,
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
