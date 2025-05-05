import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/view/friend_connection_view/widget/friend_view_card.dart';

class FriendConnectionView extends StatefulWidget {
  const FriendConnectionView({super.key});

  @override
  State<FriendConnectionView> createState() => _FriendConnectionViewState();
}

class _FriendConnectionViewState extends State<FriendConnectionView> {
  List friendRequests = [
    {
      'name': 'Istiak Ahmed',
      'mutual': '6 mutule friends',
      'time': '5d',
      'image': AppImages.istiak,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Connections",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Friend requests ",
                          style: TextStyle(
                            color: AppColors.black33,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: "320",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: FriendViewCard(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
