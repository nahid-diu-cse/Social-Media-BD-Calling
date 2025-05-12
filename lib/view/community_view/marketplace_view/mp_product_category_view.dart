import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';

class MpProductCategoryView extends StatelessWidget {
  const MpProductCategoryView({super.key});

  // Category data
  final List<Map<String, dynamic>> categories = const [
    {'icon': Icons.phone_android, 'label': 'Mobile Phones'},
    {'icon': Icons.directions_car, 'label': 'Cars'},
    {'icon': Icons.weekend, 'label': 'Furniture'},
    {'icon': Icons.computer, 'label': 'Electronics'},
    {'icon': Icons.home, 'label': 'Real Estate'},
    {'icon': Icons.sports_esports, 'label': 'Games & Entertainment'},
    {'icon': Icons.pets, 'label': 'Pets'},
    {'icon': Icons.more_horiz, 'label': 'Other'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "All categories"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return _tile(Icon(category['icon']), category['label']);
          },
        ),
      ),
    );
  }

  Widget _tile(Icon icon, String label) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.gray100,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
      title: CustomText(
        title: label,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
      ),
      onTap: () {
        // Optional tap action
      },
    );
  }
}
