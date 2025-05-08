import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/res/customStyle/customText.dart';

import '../../../res/appColors/app_colors.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.arrow_back_ios, size: 20),
              ),
              SizedBox(height: 10.h),
              CustomText(
                title: "What's your community about?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black33,
                ),
                textAlign: TextAlign.center,
              ),
              CustomText(
                title:
                    "Select any options that describe what you'll be discussing with your community.",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black100,
                ),
                textAlign: TextAlign.center,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
