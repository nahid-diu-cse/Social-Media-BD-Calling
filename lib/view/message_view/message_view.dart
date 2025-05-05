import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/commonWidget/custom_text_field.dart';
import 'package:social_media/res/customStyle/customText.dart';
import 'package:social_media/view/group_messsage_view/group_chat_view.dart';
import 'package:social_media/view/member_view/member_view.dart';
import 'package:social_media/view/message_view/messages_chat_view.dart';
import 'package:social_media/view/message_view/widget/message_view_card.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  final List chatList = [
    {
      "name": "Randy Stanton",
      "title": "This is demo text for the message?",
      "image": "assets/images/randy stanton.png",
      "text": "Just Now",
      "text2": 12,
    },
    {
      "name": "Marcus Vaccaro",
      "title": "This is demo text for the message?",
      "image": "assets/images/marcus.png",
      "text": "1m ago",
      "text2": 01,
    },
    {
      "name": "Hanna Levin",
      "title": "This is demo text for the message?",
      "image": "assets/images/hanna.png",
      "text": "1m ago",
      "text2": 10,
    },
    {
      "name": "Livia Dias",
      "title": "This is demo text for the message?",
      "image": "assets/images/livia.png",
      "text": "1m ago",
      "text2": 08,
    },
    {
      "name": "Hanna Siphron",
      "title": "This is demo text for the message?",
      "image": "assets/images/hanna1.png",
      "text": "1m ago",
      "text2": 12,
    },
    {
      "name": "Cheyenne Mango",
      "title": "This is demo text for the message?",
      "image": "assets/images/istiak.png",
      "text": "1m ago",
      "text2": 12,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios)),
        actions: [Icon(Icons.add)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 10),
            CustomTextField(
              hintText: "Search chats and messages",
              prefixIcon: Icon(Icons.search),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                CustomText(
                  title: "Personal",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(width: 15),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>GroupChatView());
                  },
                  child: CustomText(
                    title: "Group",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black100,
                  ),
                ),
                SizedBox(width: 15),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>MemberView());
                  },
                  child: CustomText(
                    title: "Requests",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black100,
                  ),
                ),
              ],
            ),
            Divider(),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: GestureDetector(
                      onTap: (){
                        Get.to(()=>MessagesChatView());
                      },
                      child: MessageViewCard()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
