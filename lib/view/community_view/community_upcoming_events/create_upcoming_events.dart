import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/custom_text_field.dart';

class CreateUpcomingEvents extends StatelessWidget {
  const CreateUpcomingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Create Event",
        actions: [
          TextButton(
            onPressed: () {},
            child: CustomText(
              title: "Create",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.mainColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: width,
                height: height * .15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.gray500, width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.plus),
                    CustomText(
                      title: "Upload Banner",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * .02),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  title: "Event Name",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
              ),
              SizedBox(height: height * .007),
              CustomTextField(hintText: "Enter event name"),
              SizedBox(height: height * .02),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  title: "Select Date",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
              ),
              SizedBox(height: height * .007),
              CustomTextField(
                hintText: "Select Date",
                prefixIcon: Icon(Icons.calendar_month),
              ),
              SizedBox(height: height * .02),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  title: "Select Time",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
              ),
              SizedBox(height: height * .007),
              CustomTextField(
                hintText: "Select time",
                prefixIcon: Icon(Icons.timelapse_outlined),
              ),
              SizedBox(height: height * .02),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  title: "Address",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
              ),
              SizedBox(height: height * .007),
              CustomTextField(
                hintText: "Enter event address",
              ),
              SizedBox(height: height * .02),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  title: "About Event",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
              ),
              SizedBox(height: height * .007),
              CustomTextField(
                hintText: "Type event description",
                minHeight: 60,
                maxLines: 4,
                borderRadius: 12,
                textStyle: TextStyle(fontSize: 14, color: Colors.black87),
                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
              SizedBox(height: height * .01),
              CustomButton(title: "Submit", onTap: (){})
        
            ],
          ),
        ),
      ),
    );
  }
}
