import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:social_media/view/new_post_view/select_category_view.dart';
import 'package:social_media/view_model/controller/add_post_controller/add_post_controller.dart';
import '../../res/appColors/app_colors.dart';
import '../../res/appImage/App_images.dart';
import '../../res/commonWidget/customText.dart';
import '../../res/commonWidget/custom_app_bar.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  AddPostController addPostController = Get.put(AddPostController());

  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        leading: Column(),
        title: "Add Post",
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: (){
                Get.to(SelectCategoryView());
              },
              child: CustomText(
                title: "Next",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.mainColor,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Divider(),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Get.to(() => ClipsGalleryView());
                      addPostController.pickImage();
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Image.asset(AppImages.add),
                    ),
                  ),
                  SizedBox(width: 10),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.to(() => ClipsGalleryView());
                  //   },
                  //   child: SizedBox(
                  //     height: 60,
                  //     width: 60,
                  //     child: Image.asset(AppImages.willpost),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 5),
              TextField(
                controller: addPostController.descriptionTextController,
                decoration: InputDecoration(
                  hintText: "Write post description...",
                  filled: true,
                  fillColor: Colors.grey[100],
                  // Soft background
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.blueAccent, // Focus color
                      width: 1,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                ),
                maxLines: 8,
                minLines: 4,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
