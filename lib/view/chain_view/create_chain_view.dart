import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/res/commonWidget/custom_text_field.dart';

import '../buttom_navi_bar_view/buttom_navi_bar_view.dart';

class CreateChainView extends StatefulWidget {
  const CreateChainView({super.key});

  @override
  State<CreateChainView> createState() => _CreateChainViewState();
}

class _CreateChainViewState extends State<CreateChainView> {
  String? selectedInterestsLabel;
  final List<String> options = ["Public", "Private", "Invite Only"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(title: "Create New Chain"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Divider(
              thickness: 1,
              color: AppColors.gray100,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                title: 'Chain Name',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 4.h,),
            CustomTextField(),
            SizedBox(height: 8.h,),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                title: 'Category',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 4.h,),
            _customDropdown(
              context: context,
              selectedInterestsLabel: selectedInterestsLabel,
              onTap: () {
                // Handle tap
                showInterestFilterSheet(context);
              },
            ),
            SizedBox(height: 8.h),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                title: 'Purpose',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 4.h,),
            _customDropdown(
              context: context,
              selectedInterestsLabel: selectedInterestsLabel="Why the chain exists?",
              onTap: () {
                // Handle tap
                showInterestFilterSheet(context);
              },
            ),
            SizedBox(height: 8.h),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                title: 'Privacy',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 4.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.all(2),
                // Padding inside the whole toggle group
                decoration: BoxDecoration(
                  color: AppColors.gray100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(options.length, (index) {
                    final isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () => setState(() => selectedIndex = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        // Spacing between buttons
                        decoration: BoxDecoration(
                          color:
                          isSelected
                              ? AppColors.mainColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow:
                          isSelected
                              ? [
                            BoxShadow(
                              color: AppColors.mainColor.withOpacity(
                                0.2,
                              ),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                              : [],
                        ),
                        child: Text(
                          options[index],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color:
                            isSelected
                                ? Colors.white
                                : Colors.grey.shade700,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            Spacer(),
            CustomButton(title: "Submit", onTap: () {
              Get.offAll(()=>ButtomNaviBarView());
            }),
          ],
        ),
      ),
    );
  }


  Widget _customDropdown({
    required BuildContext context,
    String? selectedInterestsLabel,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                selectedInterestsLabel ?? "Select",
                style: TextStyle(
                  fontSize: 14,
                  color: selectedInterestsLabel == null ? Colors.grey : Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }




  void showInterestFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: AppColors.whiteColor,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: StatefulBuilder(
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

              return Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(null),
                        CustomText(
                          title: "Interests",
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          title: "Preset",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        CustomText(
                          title: "Set Preset",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Preset Tabs
                    const Row(
                      children: [
                        Chip(label: CustomText(title: "Feed 1")),
                        SizedBox(width: 8),
                        Chip(label: CustomText(title: "Feed 2")),
                        SizedBox(width: 8),
                        Chip(label: CustomText(title: "Feed 3")),
                      ],
                    ),

                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        title: "Content Type",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Content Types
                    Row(
                      children: [
                        FilterChip(
                          label: const CustomText(title: "Photos"),
                          selected: false,
                          onSelected: (_) {},
                        ),
                        SizedBox(width: 8),
                        FilterChip(
                          label: const CustomText(title: "Videos"),
                          selected: false,
                          onSelected: (_) {},
                        ),
                        SizedBox(width: 8),
                        FilterChip(
                          label: const CustomText(title: "Clips"),
                          selected: false,
                          onSelected: (_) {},
                        ),
                        SizedBox(width: 8),
                        FilterChip(
                          label: const CustomText(title: "Communities"),
                          selected: false,
                          onSelected: (_) {},
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: CustomText(
                        title: "Interests",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.gray100,
                            ),
                            onPressed: () {
                              setState(() => selected.clear());
                              // Do something with `selected`
                            },
                            child: const CustomText(
                              title: "Clear All",
                              style: TextStyle(color: AppColors.gray600),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.mainColor,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              // Do something with `selected`
                            },
                            child: CustomText(
                              title: "Apply",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
