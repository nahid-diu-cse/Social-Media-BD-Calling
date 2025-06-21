import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/model/connections_data_model/nearby_user_data_model.dart';
import 'package:social_media/view_model/controller/connection_controller/connections_controller.dart';
import '../../../../res/appColors/app_colors.dart';
import '../../../../res/appImage/App_images.dart';
import '../../../../res/commonWidget/customText.dart';
import '../../../../res/commonWidget/custom_container_text_card.dart';

// Enum for button state
enum FriendButtonState { initial, cancel, deleted }

class NcWidget extends StatefulWidget {
  NcWidget({super.key, required this.data});

  final Data data;

  @override
  State<NcWidget> createState() => _NcWidgetState();
}

class _NcWidgetState extends State<NcWidget> {
  FriendButtonState btnState = FriendButtonState.initial;

  ConnectionsController connectionsController = Get.put(
    ConnectionsController(),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      width: double.infinity,
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage:
                widget.data.profilePicture != null &&
                        widget.data.profilePicture!.isNotEmpty
                    ? NetworkImage("${widget.data.profilePicture}")
                        as ImageProvider
                    : AssetImage(AppImages.istiak),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      title: "${widget.data.fullname}",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    Spacer(),
                    CustomText(
                      title: "5d",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomText(
                      title: "6 mutual friends",
                      fontSize: 16,
                      color: AppColors.black100,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    if (btnState == FriendButtonState.initial) ...[
                      Expanded(
                        child: CustomContainerTextCard(
                          text: "Add friend",
                          onTap: () {
                            connectionsController.sendRequest(
                              "${widget.data.id}",
                            );
                            setState(() {
                              btnState = FriendButtonState.cancel;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: CustomContainerTextCard(
                          text: "Delete",
                          textColor: AppColors.black33,
                          cardColor: Colors.white,
                          border: Border.all(color: AppColors.black100),
                          onTap: () {
                            setState(() {
                              btnState = FriendButtonState.deleted;
                            });
                          },
                        ),
                      ),
                    ] else if (btnState == FriendButtonState.cancel) ...[
                      Expanded(
                        child: CustomContainerTextCard(
                          text: "Cancel",
                          cardColor: AppColors.mainColor.withOpacity(.1),
                          textColor: AppColors.mainColor,
                          onTap: () {
                            // Call your cancel API here if needed
                            setState(() {
                              btnState = FriendButtonState.initial;
                            });
                          },
                        ),
                      ),
                    ] else if (btnState == FriendButtonState.deleted) ...[
                      Expanded(
                        child: CustomContainerTextCard(
                          text: "Deleted",
                          cardColor: AppColors.red500.withOpacity(.1),
                          textColor: AppColors.red500,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
