import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media/repo/add_post_repo/add_post_repo.dart';

import '../../../view/buttom_navi_bar_view/buttom_navi_bar_view.dart';

class AddPostController extends GetxController {
  var pickedImage = Rx<File?>(null);
  final _api = AddPostRepo();
  final descriptionTextController = TextEditingController();

  // Selected content type
  RxString? selectedContentType = RxString("");

  // Selected interests
  RxList<String> selectedInterests = <String>[].obs;

  // Privacy index (default 0: Public)
  RxInt selectedPrivacyIndex = 0.obs;

  // Privacy options
  final List<String> privacyOptions = ["Public", "Private", "Invite Only"];

  // Interests
  final List<String> allInterests = [
    "Web3",
    "Tech & Innovation",
    "UI/UX Design",
    "Cloud Computing",
    "Robotics",
    "PC Gaming",
    "VR",
    "Graphic Design",
    "Video Editing",
    "Meditation",
    "Gym",
    "Yoga",
    "Outdoor Activities",
    "Dieting",
  ];

  // Content types
  final List<String> contentTypes = [
    "Photos",
    "Videos",
    "Clips",
    "Communities",
  ];

  Future<void> submitPost() async {
    var data = {
      "content": descriptionTextController.text,
      "privacy": privacyOptions[selectedPrivacyIndex.value],
      "preset": "Default",
      "contentType": selectedContentType,
      "interest": selectedInterests,
    };
    if (pickedImage.value != null) {
      _api.addPostUrl(data, pickedImage.value).then((value) {
        if (value['success'] == true) {
          Get.offAll(() => ButtomNaviBarView());
          print(
            "///////////////////////////////////////////////////////////////////////////////////////////////////////////////////",
          );
        } else {}
      });
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = File(image.path);
    }
  }

  void removeImage() {
    pickedImage.value = null;
  }

  // Methods to update state
  void setContentType(String? value) {
    selectedContentType?.value = value!;
  }

  void setInterests(List<String> value) {
    selectedInterests.value = value;
  }

  void setPrivacyIndex(int value) {
    selectedPrivacyIndex.value = value;
  }

  void clearAll() {
    selectedContentType?.value = "";
    selectedInterests.clear();
    selectedPrivacyIndex.value = 0;
  }
}
