import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/customStyle/customText.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy Policy",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title: "1. ", fontSize: 15),
                CustomText(
                  title:
                  "Lorem ipsum dolor sit amet consectetur.\nImperdiet iaculis convallis bibendum massa id\nelementum consectetur neque mauris.",
                  fontSize: 15,
                  maxLines: 3,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title: "1. ", fontSize: 15),
                CustomText(
                  title:
                  "Lorem ipsum dolor sit amet consectetur.\nImperdiet iaculis convallis bibendum massa id\nelementum consectetur neque mauris.",
                  fontSize: 15,
                  maxLines: 3,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title: "1. ", fontSize: 15),
                CustomText(
                  title:
                  "Lorem ipsum dolor sit amet consectetur.\nImperdiet iaculis convallis bibendum massa id\nelementum consectetur neque mauris.",
                  fontSize: 15,
                  maxLines: 3,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title: "1. ", fontSize: 15),
                CustomText(
                  title:
                  "Lorem ipsum dolor sit amet consectetur.\nImperdiet iaculis convallis bibendum massa id\nelementum consectetur neque mauris.",
                  fontSize: 15,
                  maxLines: 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
