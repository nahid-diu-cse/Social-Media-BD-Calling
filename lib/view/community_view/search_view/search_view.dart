import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/custom_text_field.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/view/community_view/new_community_view/new_community_view.dart';

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
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
              StatefulBuilder(
                builder: (context, setState) {
                  List<String> interests = [
                    "Web3",
                    "Tech & Innovation",
                    "UI/UX Design",
                    "Cloud Computing",
                    "Robotics",
                    "PC Gaming",
                    "VR",
                    "Graphic Design",
                    "Video Editing",
                    "Meditation",
                    "Gym",
                    "Yoga",
                    "Outdoor Activities",
                    "Dieting",
                  ];

                  Set<String> selected = {"Tech & Innovation", "Gym"};

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      // Search Field
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Search interests",
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: AppColors.whiteShade1,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Interests Chips
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            interests.map((interest) {
                              final isSelected = selected.contains(interest);
                              return FilterChip(
                                label: Text(interest),
                                selected: isSelected,
                                selectedColor: Colors.blue.shade50,
                                checkmarkColor: Colors.blue,
                                onSelected: (_) {
                                  setState(() {
                                    if (isSelected) {
                                      selected.remove(interest);
                                    } else {
                                      selected.add(interest);
                                    }
                                  });
                                },
                              );
                            }).toList(),
                      ),

                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
              Spacer(),
              CustomButton(
                title: "Continue",
                onTap: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
