import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/customStyle/customText.dart';
import 'package:social_media/view/profile_view/profile_edit.dart';
import 'package:social_media/view/profile_view/widget/container_view_card.dart';
import 'package:social_media/view/setting_view/setting_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 146,
                  width: double.infinity,
                  child: Image.asset(AppImages.bgimage, fit: BoxFit.cover),
                ),
                Positioned(
                  left: 188,
                  top: 68,
                  child: CustomText(
                    title: "Profile",
                    color: AppColors.bgColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Positioned(
                  top: 95,
                  left: 15,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(AppImages.profile1),
                      ),
                      Positioned(
                        left: 78,
                        top: 78,
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 20),
                      CustomText(
                        title: "Zuhran Ahmad",
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                      GestureDetector(
                          onTap: (){
                            Get.to(()=>SettingView());
                          },
                          child: Icon(Icons.settings)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      SizedBox(width: 140),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "221 ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: "Followers",
                              style: TextStyle(
                                color: AppColors.black100,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "117 ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: "Mutual",
                              style: TextStyle(
                                color: AppColors.black100,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      CustomText(
                        title:
                            "🚀 Tech Enthusiast | Software Developer | Innovation",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.mainColor,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      CustomText(
                        title: "Los Angles, CA",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: AppColors.mainColor,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      CustomText(
                        title: "www.zuhranahmad.com",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      CustomText(
                        title: "Interests",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      CustomText(
                        title:
                            "#TechGeek, #CodeLife, #Innovation, Web3, #uiuxweb \n#lagunabeach",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black100,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Get.to(()=>ProfileEdit());
                        },
                        child: ContainerViewCard(
                          text: 'Edit Profile',
                          image: AppImages.edit,
                        ),
                      ),
                      ContainerViewCard(
                        text: 'Chain',
                        textColor: AppColors.black33,
                        cardColor: AppColors.bgColor,
                        image: AppImages.blockchain,
                        imagecolor: Colors.black,
                        border: Border.all(color: AppColors.black33),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: "Posts",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        title: "Photos",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        title: "Videos",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        title: "Clips",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(width: 100),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    width: 340,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(AppImages.profile1),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: "John Doe",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      title: "Los Angles,CA ",
                                      color: AppColors.black33,
                                      fontSize: 15,
                                    ),
                                    CustomText(
                                      title: ".20h ago",
                                      color: AppColors.black33,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Column(
                            children: [
                              CustomText(
                                title:
                                    "Lorem ipsum dolor sit amet. Ut molestiaetio in dignissimos et iste dicta aut dolores veniam At one maxime fugiat. Ut internos toquiered consequatur in omnis of esse sed tempore odit ut optio enim!",
                                maxLines: 4,
                                fontSize: 16,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      AppImages.favorite,
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(width: 3),
                                    CustomText(
                                      title: "12k",
                                      fontSize: 14,
                                      color: AppColors.black100,
                                    ),
                                    Image.asset(
                                      AppImages.sms,
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(width: 3),
                                    CustomText(
                                      title: "10k",
                                      fontSize: 14,
                                      color: AppColors.black100,
                                    ),
                                    Image.asset(
                                      AppImages.refresh,
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(width: 3),
                                    CustomText(
                                      title: "122",
                                      fontSize: 14,
                                      color: AppColors.black100,
                                    ),
                                    Image.asset(
                                      AppImages.book,
                                      height: 20,
                                      width: 20,
                                    ),
                                    Image.asset(
                                      AppImages.share,
                                      height: 20,
                                      width: 20,
                                    ),
                                    Image.asset(
                                      AppImages.dot,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    width: 340,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(AppImages.profile1),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: "John Doe",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      title: "Los Angles,CA ",
                                      color: AppColors.black33,
                                      fontSize: 15,
                                    ),
                                    CustomText(
                                      title: ".20h ago",
                                      color: AppColors.black33,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Column(
                            children: [
                              CustomText(
                                title:
                                    "Lorem ipsum dolor sit amet. Ut molestiaetio in dignissimos et iste dicta aut dolores veniam At one maxime fugiat. Ut internos toquiered consequatur in omnis of esse sed tempore odit ut optio enim!",
                                maxLines: 4,
                                fontSize: 16,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      AppImages.favorite,
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(width: 3),
                                    CustomText(
                                      title: "12k",
                                      fontSize: 14,
                                      color: AppColors.black100,
                                    ),
                                    Image.asset(
                                      AppImages.sms,
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(width: 3),
                                    CustomText(
                                      title: "10k",
                                      fontSize: 14,
                                      color: AppColors.black100,
                                    ),
                                    Image.asset(
                                      AppImages.refresh,
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(width: 3),
                                    CustomText(
                                      title: "122",
                                      fontSize: 14,
                                      color: AppColors.black100,
                                    ),
                                    Image.asset(
                                      AppImages.book,
                                      height: 20,
                                      width: 20,
                                    ),
                                    Image.asset(
                                      AppImages.share,
                                      height: 20,
                                      width: 20,
                                    ),
                                    Image.asset(
                                      AppImages.dot,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
