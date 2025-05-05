import 'package:flutter/material.dart';
import 'package:social_media/res/appImage/App_images.dart';

class MessagesChatView extends StatelessWidget {
  const MessagesChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(AppImages.hanna, height: 36, width: 36),
            ),
          ],
        ),
      ),
    );
  }
}
