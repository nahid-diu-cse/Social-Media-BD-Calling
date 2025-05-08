import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/customStyle/customText.dart';
import 'package:social_media/view/message_view/message_view.dart';

class ClipsGalleryView extends StatefulWidget {
  const ClipsGalleryView({super.key});

  @override
  State<ClipsGalleryView> createState() => _ClipsGalleryViewState();
}

class _ClipsGalleryViewState extends State<ClipsGalleryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_ios)),
                    Row(
                      children: [
                        CustomText(
                          title: "Clips",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(width: 5),
                        Image.asset(AppImages.account, width: 34, height: 34),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=>MessageView());
                      },
                      child: CustomText(
                        title: "Next",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    height: 370,
                    width: double.infinity,
                    child: Image.asset(AppImages.clip, fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Image.asset(AppImages.arrow, width: 32, height: 32),
                  ),
                  Positioned(
                    top: 160,
                    left: 175,
                    child: Image.asset(AppImages.play, width: 32, height: 32),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            height: 77,
                            width: 77,
                            child: Image.asset(AppImages.photo),
                          ),
                          Positioned(
                            top: 25,
                            left: 15,
                            child: CustomText(
                              title: "Normal",
                              color: AppColors.bgColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        height: 77,
                        width: 77,
                        child: Image.asset(AppImages.photo),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        height: 77,
                        width: 77,
                        child: Image.asset(AppImages.photo),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        height: 77,
                        width: 77,
                        child: Image.asset(AppImages.photo),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        height: 77,
                        width: 77,
                        child: Image.asset(AppImages.photo),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        height: 77,
                        width: 77,
                        child: Image.asset(AppImages.photo),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    title: "Filter",
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                  CustomText(
                    title: "Edit",
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: AppColors.black100,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          title: "Gallery",
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        SizedBox(width: 15),
                        Icon(Icons.arrow_upward, size: 20, color: Colors.grey),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 78,
                          width: 77,
                          child: Image.asset(
                            AppImages.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 78,
                          width: 77,
                          child: Image.asset(
                            AppImages.image1,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 78,
                          width: 77,
                          child: Image.asset(
                            AppImages.image2,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 78,
                          width: 77,
                          child: Image.asset(
                            AppImages.image3,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 78,
                          width: 77,
                          child: Image.asset(
                            AppImages.image4,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 78,
                          width: 77,
                          child: Image.asset(
                            AppImages.image5,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 78,
                          width: 77,
                          child: Image.asset(
                            AppImages.image6,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 78,
                          width: 77,
                          child: Image.asset(
                            AppImages.image7,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
