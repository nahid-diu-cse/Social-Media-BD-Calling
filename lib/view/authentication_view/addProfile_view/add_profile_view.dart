import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/view/authentication_view/addProfile_view/profile_picture_view.dart';

class AddProfileView extends StatefulWidget {
  const AddProfileView({super.key});

  @override
  State<AddProfileView> createState() => _AddProfileViewState();
}

class _AddProfileViewState extends State<AddProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios_rounded)),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  title: "Add a profile picture so that\n friends can find you",
                  fontSize: 25,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(height: 32),
            CircleAvatar(radius: 110, backgroundColor: Colors.white),
            SizedBox(height: 240),
            CustomButton(
              title: "Next",
              fontSize: 15,
              onTap: () {
                Get.bottomSheet(
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: AppColors.bgColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          SizedBox(height: 32),
                          InkWell(
                            onTap: (){
                              Get.to(ProfilePictureView());
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.photo,
                                  size: 20,
                                  color: AppColors.mainColor,
                                ),
                                SizedBox(width: 10),
                                CustomText(
                                  title: "Choose From Camera Roll",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.camera_alt_rounded,
                                size: 20,
                                color: AppColors.mainColor,
                              ),
                              SizedBox(width: 10),
                              CustomText(
                                title: "Take Photo",
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
