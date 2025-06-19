import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/res/commonWidget/custom_container_text_card.dart';
import 'package:social_media/view/home_view/chat_view/chat_list_view.dart';
import 'package:social_media/view/home_view/home_full_story_view.dart';
import 'package:social_media/view/home_view/nearby_view/nearby_connection_view.dart';
import 'package:social_media/view/new_post_view/clips_view.dart';
import 'package:social_media/view/new_post_view/new_post_view.dart';
import 'friend_connection_view/friend_connection_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<Map<String, String>> stories = [
    {'name': 'Your Story', 'image': AppImages.story, 'type': 'own'},
    {'name': 'John Doe', 'image': AppImages.johndoe, 'type': ''},
    {'name': 'Alisha Pretty', 'image': AppImages.alisha, 'type': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImages.splashBg, width: 100, height: 20),
        actions: [
          InkWell(
            onTap: () {},
            child: Image.asset(AppImages.friend, width: 22, height: 22),
          ),
          SizedBox(width: 15),
          Image.asset(AppImages.notification, width: 22, height: 22),
          SizedBox(width: 15),
          InkWell(
            onTap: () {
              Get.to(ChatListView());
            },
            child: Image.asset(AppImages.message, width: 22, height: 22),
          ),
          SizedBox(width: 15),
          Image.asset(AppImages.search, width: 22, height: 22),
          SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Divider(),
            Row(
              children:
                  stories.map((story) {
                    return GestureDetector(
                      onTap: () {
                        story['type'] == 'own'
                            ? bottomSnack()
                            : Get.to(HomeFullStoryView());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 45,
                              backgroundImage: AssetImage(story['image']!),
                            ),
                            CustomText(title: story['name']!, fontSize: 13),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomContainerTextCard(text: "For you"),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(NearbyView());
                      },
                      child: CustomText(
                        title: "Nearby",
                        fontSize: 16,
                        color: AppColors.black100,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => FriendConnectionView());
                      },
                      child: CustomText(
                        title: "Connections",
                        fontSize: 16,
                        color: AppColors.black100,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Image.asset(AppImages.filter, height: 20, width: 20),
              ],
            ),
            Divider(),
            SizedBox(
              height: 400,
              width: 343,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(AppImages.alishadoe),
                    ),
                    title: CustomText(
                      title: "Alisha Doe",
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    subtitle: Row(
                      children: [
                        CustomText(title: "Los Angles,CA "),
                        CustomText(title: ".20h ago"),
                      ],
                    ),
                    trailing: Container(
                      height: 30,
                      width: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF4F5FA),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 15,
                              color: AppColors.mainColor,
                            ),
                            SizedBox(width: 5),
                            CustomText(
                              title: "Follow",
                              color: AppColors.mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      children: [
                        CustomText(
                          title:
                              "Community connections are very important \nand this platform has all for it.",
                          maxLines: 2,
                          fontSize: 17,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 5),
                        Image.asset(
                          AppImages.dog,
                          height: 220,
                          width: 315,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Image.asset(AppImages.sms, height: 20, width: 20),
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
                              Image.asset(AppImages.dot, height: 20, width: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Image.asset(AppImages.blockchain, height: 17, width: 17),
                SizedBox(width: 10),
                CustomText(
                  title: "Chain Suggestions",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 200,
              width: 343,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(AppImages.alishadoe),
                    ),
                    title: CustomText(
                      title: "John Doe",
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    subtitle: Row(
                      children: [
                        CustomText(title: "Los Angles,CA "),
                        CustomText(title: ".20h ago"),
                      ],
                    ),
                    trailing: Container(
                      height: 30,
                      width: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF4F5FA),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 15,
                              color: AppColors.mainColor,
                            ),
                            SizedBox(width: 5),
                            CustomText(
                              title: "Follow",
                              color: AppColors.mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      children: [
                        CustomText(
                          title:
                              "Lorem ipsum dolor sit amet. Ut molestiaetio in dignissimos et iste dicta aut dolores veniam At one maxime fugiat. Ut internos toquiered consequatur in omnis of esse sed tempore odit ut optio enim!",
                          maxLines: 4,
                          fontSize: 17,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Image.asset(AppImages.sms, height: 20, width: 20),
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
                              Image.asset(AppImages.dot, height: 20, width: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            SizedBox(
              height: 470,
              width: 343,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(AppImages.alishadoe),
                    ),
                    title: CustomText(
                      title: "Catherine",
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    subtitle: Row(
                      children: [Text("Los Angles,CA "), Text(".20h ago")],
                    ),
                    trailing: Container(
                      height: 30,
                      width: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF4F5FA),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 15,
                              color: AppColors.mainColor,
                            ),
                            SizedBox(width: 5),
                            CustomText(
                              title: "Follow",
                              color: AppColors.mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      children: [
                        CustomText(
                          title:
                              "Community connections are very important and this platform has all for it.",
                          maxLines: 2,
                          fontSize: 17,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 5),
                        Image.asset(
                          AppImages.catherine,
                          height: 310,
                          width: 315,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Image.asset(AppImages.sms, height: 20, width: 20),
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
                              Image.asset(AppImages.dot, height: 20, width: 20),
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

  Future bottomSnack() {
    return Get.bottomSheet(
      Container(
        height: 151,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: AppColors.bgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5),
              Container(
                height: 5,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Get.to(() => NewPostView());
                },
                child: Row(
                  children: [
                    Image.asset(AppImages.square, height: 18, width: 18),
                    SizedBox(width: 10),
                    CustomText(
                      title: "New Post",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  Get.to(() => ClipsView());
                },
                child: Row(
                  children: [
                    Image.asset(AppImages.square, height: 18, width: 18),
                    SizedBox(width: 10),
                    CustomText(
                      title: "Clips",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
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
