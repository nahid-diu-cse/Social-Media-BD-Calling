import 'package:flutter/material.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/customText.dart';

class BirthdayView extends StatefulWidget {
  const BirthdayView({super.key});

  @override
  State<BirthdayView> createState() => _BirthdayViewState();
}

class _BirthdayViewState extends State<BirthdayView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios_rounded)),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        title: "When’s your Birthday?",
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomText(
                    title:
                        "Your age information will be updated on your profile page and this will displayed publicly on your dashboard.",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    color: AppColors.black100,
                    maxLines: 3,
                  ),
                  SizedBox(height: 33),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 42,
                        width: 85,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.black100),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              title: "MM",
                              fontWeight: FontWeight.w600,
                            ),
                            // SizedBox(width: 10),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                      Container(
                        height: 42,
                        width: 85,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.black100),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              title: "DD",
                              fontWeight: FontWeight.w600,
                            ),
                            // SizedBox(width: 10),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                      Container(
                        height: 42,
                        width: 85,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.black100),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              title: "YYYY",
                              fontWeight: FontWeight.w600,
                            ),
                            // SizedBox(width: 10),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 44),
            CustomButton(
              title: "Continue",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
