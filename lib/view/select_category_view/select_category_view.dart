import 'package:custom_text_field_with_drop_down/custom_text_field_with_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/commonWidget/custom_container_text_card.dart';
import 'package:social_media/res/customStyle/customText.dart';

class SelectCategoryView extends StatefulWidget {
  const SelectCategoryView({super.key});

  @override
  State<SelectCategoryView> createState() => _SelectCategoryViewState();
}

class _SelectCategoryViewState extends State<SelectCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Category",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            CustomText(
              title: "Content Type",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            SizedBox(height: 10),
            CustomTextFieldWithDropDown(
              hintText: 'Select',
              hintStyle: TextStyle(fontSize: 14),
              showObscure: false,
              fillColor: Colors.white,
              borderColor: AppColors.black100,
              borderRadius: 10,
              dropdownShow: true,
              suffixIcon: Icon(Icons.arrow_drop_down),
            ),
            SizedBox(height: 10),
            CustomText(
              title: "Interests",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            SizedBox(height: 10),
            CustomTextFieldWithDropDown(
              hintText: 'Select category',
              hintStyle: TextStyle(fontSize: 14),
              showObscure: false,
              fillColor: Colors.white,
              borderColor: AppColors.black100,
              borderRadius: 10,
              dropdownShow: true,
              suffixIcon: Icon(Icons.arrow_drop_down),
            ),
            SizedBox(height: 10),
            CustomText(
              title: "Privacy",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            SizedBox(height: 10),
            Container(
              height: 35,
              width: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.black100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomContainerTextCard(
                    text: "Public",
                    height: 22,
                    width: 67,
                    fontSize: 14,
                  ),
                  CustomText(title: "Private",fontWeight: FontWeight.w500,fontSize: 14,),
                  CustomText(title: "Invite Only",fontWeight: FontWeight.w500,fontSize: 14,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
