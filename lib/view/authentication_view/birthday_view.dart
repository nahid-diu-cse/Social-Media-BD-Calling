import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/view/authentication_view/gender_view.dart';

class BirthdayView extends StatefulWidget {
  const BirthdayView({super.key});

  @override
  State<BirthdayView> createState() => _BirthdayViewState();
}

class _BirthdayViewState extends State<BirthdayView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                title: "When’s your Birthday?",
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
              SizedBox(height: 20),
              CustomText(
                title:
                "Your age information will be updated on your profile page and this will be displayed publicly on your dashboard.",
                fontWeight: FontWeight.w500,
                fontSize: 16,
                textAlign: TextAlign.center,
                color: AppColors.black100,
                maxLines: 3,
              ),
              SizedBox(height: 33),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _dateField("MM"),
                  _dateField("DD"),
                  _dateField("YYYY"),
                ],
              ),
              SizedBox(height: 44),
              CustomButton(
                title: "Continue",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                onTap: () {
                  Get.to(GenderView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dateField(String label) {
    return Container(
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
            title: label,
            fontWeight: FontWeight.w600,
          ),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}


