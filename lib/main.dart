import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/view/forgetSystem_view/change_password_view/change_password_view.dart';
import 'package:social_media/view/friend_connection_view/friend_connection_view.dart';
import 'package:social_media/view/home_view/home_view.dart';
import 'package:social_media/view/message_view/message_view.dart';
import 'package:social_media/view/message_view/messages_chat_view.dart';
import 'package:social_media/view/new_post_view/clips_gallery_view.dart';
import 'package:social_media/view/new_post_view/clips_view.dart';
import 'package:social_media/view/new_post_view/new_post_view.dart';
import 'package:social_media/view/onBoarding_view/view/onBoaring_view.dart';
import 'package:social_media/view/select_category_view/select_category_view.dart';
import 'package:social_media/view/splash_view/splashView.dart';

void main() {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set status bar style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Standard design size
      minTextAdapt: true,
      splitScreenMode:
          true, // Enable split-screen mode to avoid _splitScreenMode error
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          home: ClipsGalleryView(),
        );
      },
    );
  }
}
