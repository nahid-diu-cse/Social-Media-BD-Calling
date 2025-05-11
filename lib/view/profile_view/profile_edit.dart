import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/custom_container_text_card.dart';
import 'package:social_media/res/commonWidget/custom_text_field.dart';
import 'package:social_media/res/commonWidget/customText.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  bool isChecked = true;
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios, size: 15.sp),
          onTap: () => Get.back(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5),
              Row(
                children: [
                  CustomText(
                    title: "Profile Picture",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(AppImages.profileedit),
                  ),
                  Positioned(
                    left: 72,
                    top: 72,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CustomText(
                    title: "Cover photo",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  CustomText(
                    title: "Edit",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 125,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 35),
                    Image.asset(AppImages.addphoto, height: 36, width: 36),
                    CustomText(
                      title: "Add Photo",
                      color: AppColors.mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CustomText(
                    title: "First Name",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ],
              ),
              SizedBox(height: 5),
              CustomTextField(
                borderSide: BorderSide(color: AppColors.black100),
                hintText: "Enter your first name",
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CustomText(
                    title: "Last Name",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ],
              ),
              SizedBox(height: 5),
              CustomTextField(
                borderSide: BorderSide(color: AppColors.black100),
                hintText: "Enter your last name",
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CustomText(
                    title: "Email",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ],
              ),
              SizedBox(height: 5),
              CustomTextField(
                borderSide: BorderSide(color: AppColors.black100),
                hintText: "Enter your email",
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CustomText(
                    title: "Gender",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    shape: CircleBorder(),
                    activeColor: AppColors.mainColor,
                  ),
                  CustomText(title: "Male", fontSize: 16),
                  SizedBox(width: 20),
                  Checkbox(
                    value: checked,
                    onChanged: (bool? value) {
                      setState(() {
                        checked = value!;
                      });
                    },
                    shape: CircleBorder(),
                    activeColor: AppColors.mainColor,
                  ),
                  CustomText(title: "Female", fontSize: 16),
                ],
              ),
              Row(
                children: [
                  CustomText(
                    title: "Date of Birth",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.black33,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomContainerTextCard(
                    text: "22",
                    width: 100,
                    height: 40,
                    cardColor: AppColors.bgColor,
                    textColor: AppColors.black33,
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(color: AppColors.black100),
                  ),
                  CustomContainerTextCard(
                    text: "03",
                    width: 100,
                    height: 40,
                    cardColor: AppColors.bgColor,
                    textColor: AppColors.black33,
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(color: AppColors.black100),
                  ),
                  CustomContainerTextCard(
                    text: "1998",
                    width: 100,
                    height: 40,
                    cardColor: AppColors.bgColor,
                    textColor: AppColors.black33,
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(color: AppColors.black100),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CustomText(
                    title: "Location",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ],
              ),
              SizedBox(height: 5),
              CustomTextField(
                borderSide: BorderSide(color: AppColors.black100),
                hintText: "Enter your Location address",
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CustomText(
                    title: "Website",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ],
              ),
              SizedBox(height: 5),
              CustomTextField(
                borderSide: BorderSide(color: AppColors.black100),
                hintText: "Enter your Website",
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CustomText(
                    title: "Interests",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 28,
                        width: 84,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFE8EBFF),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 15),
                            CustomText(
                              title: "Web3",
                              color: AppColors.black100,
                            ),
                            Icon(Icons.close, size: 15, color: Colors.red),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 28,
                        width: 84,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFE8EBFF),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 15),
                            CustomText(
                              title: "Codelife",
                              color: AppColors.black100,
                            ),
                            Icon(Icons.close, size: 15, color: Colors.red),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              CustomButton(title: "Update",fontWeight: FontWeight.w500, onTap: () {}),
              SizedBox(height: 10),
              SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
