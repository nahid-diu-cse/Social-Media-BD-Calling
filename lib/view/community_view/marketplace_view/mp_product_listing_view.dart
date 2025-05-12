import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/custom_drop_down.dart';
import 'package:social_media/res/commonWidget/custom_text_field.dart';
import '../../../res/appColors/app_colors.dart';
import '../../../res/appImage/App_images.dart';

class MpProductListingView extends StatefulWidget {
  const MpProductListingView({super.key});

  @override
  State<MpProductListingView> createState() => _MpProductListingViewState();
}

class _MpProductListingViewState extends State<MpProductListingView> {
  final _formKey = GlobalKey<FormState>();
  String title = '',
      price = '',
      category = 'Select category',
      condition = 'Select condition',
      location = 'Dhaka, Bangladesh',
      description = '';

  // Sample list of categories, conditions, and locations
  List<String> categories = ['Electronics', 'Furniture', 'Clothing', 'Books'];
  List<String> conditions = ['New', 'Used'];
  List<String> locations = ['Dhaka, Bangladesh', 'Chittagong, Bangladesh', 'Sylhet, Bangladesh'];

  // Initially selected values (optional, can be null)
  String? selectedCategory;
  String? selectedCondition;
  String? selectedLocation;

  // Callback for when a category is selected (accepting String?)
  void onCategorySelected(String? category) {
    setState(() {
      selectedCategory = category;
    });
  }

  // Callback for when a condition is selected (accepting String?)
  void onConditionSelected(String? condition) {
    setState(() {
      selectedCondition = condition;
    });
  }

  // Callback for when a location is selected (accepting String?)
  void onLocationSelected(String? location) {
    setState(() {
      selectedLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(title: "New Listing"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildProfileTile(),
              _buildUploadBanner(width, height),
              _buildFormFields(),
              CustomButton(title: "Submit", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileTile() {
    return ListTile(
      leading: CircleAvatar(
        radius: 20.r,
        backgroundImage: AssetImage(AppImages.profile),
      ),
      title: CustomText(
        title: "Istiak Ahmed Sohan",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
      ),
      subtitle: CustomText(
        title: "Listing on Marketplace",
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
      ),
    );
  }

  Widget _buildUploadBanner(double width, double height) {
    return Container(
      width: width,
      height: height * .15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(width: 0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.media, height: 36.h, width: 36.w),
          CustomText(
            title: "Add Photo",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.mainColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        SizedBox(height: 8.h),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            title: "Title",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ),
        _buildTextField('Title', (value) => setState(() => title = value!)),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            title: "Price",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ),
        _buildTextField(
          'Price',
              (value) => setState(() => price = value!),
          keyboardType: TextInputType.number,
        ),
        _buildDropdownField(
          'Category',
          categories,
          selectedCategory,
          onCategorySelected,
          'Select Category',
        ),
        _buildDropdownField(
          'Condition',
          conditions,
          selectedCondition,
          onConditionSelected,
          'Select Condition',
        ),
        _buildDropdownField(
          'Location',
          locations,
          selectedLocation,
          onLocationSelected,
          'Select Location',
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            title: "Description",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ),
        _buildTextField(
          'Description',
              (value) => setState(() => description = value!),
          maxLines: 4,
        ),
      ],
    );
  }

  Widget _buildTextField(
      String label,
      Function(String?) onChanged, {
        TextInputType? keyboardType,
        int? maxLines,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CustomTextField(
        hintText: label,
        keyboardType: keyboardType,
        maxLines: maxLines ?? 1,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildDropdownField(
      String label,
      List<String> items,
      String? value,
      Function(String?) onChanged,
      String placeholder,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CustomDropdownSelector<String>(
        title: placeholder,
        value: value,
        items: items,
        onSelected: onChanged,
        itemToString: (item) => item,
        bottomSheetHeading: label,
      ),
    );
  }
}
