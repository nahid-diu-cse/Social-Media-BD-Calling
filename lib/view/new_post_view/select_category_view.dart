import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/view_model/controller/add_post_controller/add_post_controller.dart';

import '../buttom_navi_bar_view/buttom_navi_bar_view.dart';

class SelectCategoryView extends StatefulWidget {
  SelectCategoryView({super.key});

  @override
  State<SelectCategoryView> createState() => _SelectCategoryViewState();
}

class _SelectCategoryViewState extends State<SelectCategoryView> {
  final addPostController = Get.put(AddPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Select Category"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),

            // Content Type Dropdown (Single Select)
            Obx(
              () => _SelectionField(
                label: "Content Type",
                value: addPostController.selectedContentType?.value,
                onTap:
                    () => _showBottomSheet(
                      context,
                      title: "Content Type",
                      options: addPostController.contentTypes,
                      selected: addPostController.selectedContentType?.value,
                      multiSelect: false,
                      onApply:
                          (value) => addPostController.setContentType(value?.first),
                    ),
                placeholder: "Select",
              ),
            ),
            SizedBox(height: 16.h),

            // Interests Multi-Select
            Obx(
              () => _SelectionField(
                label: "Interests",
                value:
                    addPostController.selectedInterests.isEmpty
                        ? null
                        : addPostController.selectedInterests.join(', '),
                onTap:
                    () => _showBottomSheet(
                      context,
                      title: "Select Interests",
                      options: addPostController.allInterests,
                      selected: addPostController.selectedInterests,
                      multiSelect: true,
                      onApply: (value) => addPostController.setInterests(value ?? []),
                    ),
                placeholder: "Select Interests",
              ),
            ),

            SizedBox(height: 16.h),

            // Privacy Toggle
            CustomText(
              title: "Privacy",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 6.h),
            Obx(
              () => _PrivacyToggle(
                options: addPostController.privacyOptions,
                selectedIndex: addPostController.selectedPrivacyIndex.value,
                onChanged: addPostController.setPrivacyIndex,
              ),
            ),

            const Spacer(),
            CustomButton(
              title: "Submit",
              onTap: () {
                // You can access controller's selections here
                print("hi");
                addPostController.submitPost();
              },
            ),
          ],
        ),
      ),
    );
  }

  // Bottom sheet for single/multi select
  void _showBottomSheet(
    BuildContext context, {
    required String title,
    required List<String> options,
    required dynamic selected,
    bool multiSelect = false,
    required void Function(List<String>? value) onApply,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: AppColors.whiteColor,
      builder: (context) {
        return _SelectionBottomSheet(
          title: title,
          options: options,
          initialSelected: selected,
          multiSelect: multiSelect,
          onApply: onApply,
        );
      },
    );
  }
}

/// --- Selection Field Widget (Label + Select Box)
class _SelectionField extends StatelessWidget {
  final String label;
  final String? value;
  final VoidCallback onTap;
  final String placeholder;

  const _SelectionField({
    required this.label,
    required this.value,
    required this.onTap,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: label,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomText(
                    title: value ?? placeholder,
                    style: TextStyle(
                      color: value == null ? Colors.grey : Colors.black87,
                      fontSize: 14.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// --- Privacy Toggle Widget
class _PrivacyToggle extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const _PrivacyToggle({
    required this.options,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(options.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onChanged(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.mainColor : Colors.transparent,
                borderRadius: BorderRadius.circular(24),
                boxShadow:
                    isSelected
                        ? [
                          BoxShadow(
                            color: AppColors.mainColor.withOpacity(0.18),
                            blurRadius: 7,
                            offset: const Offset(0, 2),
                          ),
                        ]
                        : [],
              ),
              child: CustomText(
                title: options[index],
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.grey.shade700,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

/// --- Bottom Sheet for Single/Multi Selection
class _SelectionBottomSheet extends StatefulWidget {
  final String title;
  final List<String> options;
  final dynamic initialSelected; // String or List<String>
  final bool multiSelect;
  final void Function(List<String>? value) onApply;

  const _SelectionBottomSheet({
    required this.title,
    required this.options,
    required this.initialSelected,
    required this.multiSelect,
    required this.onApply,
  });

  @override
  State<_SelectionBottomSheet> createState() => _SelectionBottomSheetState();
}

class _SelectionBottomSheetState extends State<_SelectionBottomSheet> {
  late List<String> _selected;
  String _search = "";

  @override
  void initState() {
    super.initState();
    if (widget.multiSelect) {
      _selected = List<String>.from(widget.initialSelected ?? []);
    } else {
      _selected =
          widget.initialSelected != null ? [widget.initialSelected] : [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final filtered =
        widget.options
            .where((e) => e.toLowerCase().contains(_search.toLowerCase()))
            .toList();

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40),
                  CustomText(
                    title: widget.title,
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
              SizedBox(height: 10.h),
              TextField(
                onChanged: (v) => setState(() => _search = v),
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: AppColors.whiteShade1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 14.h),
              // Options
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    filtered.map((e) {
                      final isSelected = _selected.contains(e);
                      return FilterChip(
                        label: Text(e),
                        selected: isSelected,
                        selectedColor: Colors.blue.shade50,
                        checkmarkColor: Colors.blue,
                        onSelected: (_) {
                          setState(() {
                            if (widget.multiSelect) {
                              if (isSelected) {
                                _selected.remove(e);
                              } else {
                                _selected.add(e);
                              }
                            } else {
                              _selected = [e];
                            }
                          });
                        },
                      );
                    }).toList(),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  if (widget.multiSelect)
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.gray100,
                        ),
                        onPressed: () => setState(() => _selected.clear()),
                        child: const CustomText(
                          title: "Clear All",
                          style: TextStyle(color: AppColors.gray600),
                        ),
                      ),
                    ),
                  if (widget.multiSelect) const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainColor,
                      ),
                      onPressed: () {
                        widget.onApply(_selected.isEmpty ? null : _selected);
                        Navigator.pop(context);
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
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
