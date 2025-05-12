import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/res/commonWidget/custom_text_field.dart';

import '../../res/appColors/app_colors.dart';
import '../../res/commonWidget/customText.dart';

class TrendingView extends StatelessWidget {
  TrendingView({super.key});

  final List<String> imageList1 = [
    AppImages.marcedes,
    AppImages.marcedes,
    AppImages.marcedes,
    AppImages.marcedes,
    AppImages.marcedes,
    AppImages.marcedes,
    // Add more image paths here
  ];
  final List<String> imageList2 = [
    AppImages.marcedes,
    AppImages.marcedes,
    AppImages.marcedes,
    // Add more image paths here
  ];

  final List<Map<String, String>> profileList = [
    {
      'image': AppImages.marcedes, // Image path
      'name': 'John Doe',
      'username': '@johndoe',
    },
    {
      'image': AppImages.marcedes,
      'name': 'Jane Smith',
      'username': '@janesmith',
    },
    {
      'image': AppImages.marcedes,
      'name': 'Robert Brown',
      'username': '@robertbrown',
    },
    {
      'image': AppImages.marcedes,
      'name': 'Emily White',
      'username': '@emilywhite',
    },
    {
      'image': AppImages.marcedes,
      'name': 'Michael Green',
      'username': '@michaelgreen',
    },
    // Add more profiles as needed
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: "Trending",actions: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.gray50.withOpacity(0.05),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              AppImages.edit,
              height: 18.w,
              width: 18.w,
              color: Colors.black,
            ),
          ),
        ),
      ],),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CustomTextField(hintText: "Search", prefixIcon: Icon(Icons.search)),
            SizedBox(height: 10.h),
            trendingImages(
              imageList: imageList1, // Pass the list of images
              crossAxisCount: 3, // Show 3 items per row
              crossAxisSpacing: 4.0, // Spacing between items
              mainAxisSpacing: 4.0, // Spacing between rows
              childAspectRatio: 1.0, // Square images
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Image.asset(AppImages.media,color: AppColors.mainColor,),
                SizedBox(width: 4.w),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    title: "Top 10s",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            _topTen(),
            SizedBox(height: 10.h),
            trendingImages(
              imageList: imageList2, // Pass the list of images
              crossAxisCount: 3, // Show 3 items per row
              crossAxisSpacing: 4.0, // Spacing between items
              mainAxisSpacing: 4.0, // Spacing between rows
              childAspectRatio: 1.0, // Square images
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Image.asset(AppImages.blockchain,color: AppColors.mainColor,),
                SizedBox(width: 4.w),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    title: "Chain Suggestions",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              height: height*.25, // Set a fixed height for the horizontal list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: profileList.length,
                itemBuilder: (context, index) {
                  return _chainSuggestion(
                    profileList[index]['image']!,
                    profileList[index]['name']!,
                    profileList[index]['username']!,
                    context,
                  );
                },
              ),
            ),
            SizedBox(height: 10.h),
            trendingImages(
              imageList: imageList1, // Pass the list of images
              crossAxisCount: 3, // Show 3 items per row
              crossAxisSpacing: 4.0, // Spacing between items
              mainAxisSpacing: 4.0, // Spacing between rows
              childAspectRatio: 1.0, // Square images
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Image.asset(AppImages.account,color: AppColors.mainColor,),
                SizedBox(width: 4.w),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    title: "Creators",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              height: height*.25, // Set a fixed height for the horizontal list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: profileList.length,
                itemBuilder: (context, index) {
                  return _chainSuggestion(
                    profileList[index]['image']!,
                    profileList[index]['name']!,
                    profileList[index]['username']!,
                    context,
                  );
                },
              ),
            ),
            SizedBox(height: 10.h),
            trendingImages(
              imageList: imageList2, // Pass the list of images
              crossAxisCount: 3, // Show 3 items per row
              crossAxisSpacing: 4.0, // Spacing between items
              mainAxisSpacing: 4.0, // Spacing between rows
              childAspectRatio: 1.0, // Square images
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Image.asset(AppImages.account,color: AppColors.mainColor,),
                SizedBox(width: 4.w),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    title: "Communities",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            trendingImages(
              imageList: imageList2, // Pass the list of images
              crossAxisCount: 3, // Show 3 items per row
              crossAxisSpacing: 4.0, // Spacing between items
              mainAxisSpacing: 4.0, // Spacing between rows
              childAspectRatio: 1.0, // Square images
            ),
          ],
        ),
      ),
    );
  }

  Widget trendingImages({
    required List<String> imageList,
    int crossAxisCount = 3, // Default 3 items per row
    double crossAxisSpacing = 2.0, // Default spacing between items
    double mainAxisSpacing = 2.0, // Default spacing between rows
    double childAspectRatio = 1.0, // Default aspect ratio
  }) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true, // Ensures it uses only the required space
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount, // Number of items per row
        crossAxisSpacing: crossAxisSpacing, // Spacing between items
        mainAxisSpacing: mainAxisSpacing, // Spacing between rows
        childAspectRatio: childAspectRatio, // Aspect ratio for items
      ),
      itemCount: imageList.length, // Number of items in the grid
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[300], // Background color for each item
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
          child: Image.asset(
            imageList[index], // Image path from the list
            fit: BoxFit.cover, // Adjust image to fill container
          ),
        );
      },
    );
  }

  Widget _topTen() {
    // Sample list of data
    List<Map<String, dynamic>> dataList = [
      {
        "name": "John Doe",
        "location": "Los Angles, CA",
        "time": ".20h ago",
        "description":
            "Lorem ipsum dolor sit amet. Ut molestias etio in dignissimos et iste dicta aut dolores veniam.",
        "followers": "12k",
        "comments": "10k",
        "shares": "122",
      },
      {
        "name": "Jane Smith",
        "location": "New York, NY",
        "time": ".1d ago",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut enim ad minim veniam.",
        "followers": "15k",
        "comments": "8k",
        "shares": "130",
      },
      {
        "name": "Alex Johnson",
        "location": "San Francisco, CA",
        "time": ".5h ago",
        "description":
            "Vivamus suscipit tortor eget felis porttitor volutpat. Cras ultricies ligula sed magna dictum porta.",
        "followers": "20k",
        "comments": "12k",
        "shares": "150",
      },
    ];

    return SizedBox(
      height: 200, // Set the height to fit your content
      width: double.infinity, // Make the container take full width
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Determine how many items to show per row based on screen width
            int itemsPerRow = 1;
            if (constraints.maxWidth > 600) {
              itemsPerRow = 2; // Show 2 items per row for larger screens
            }
            if (constraints.maxWidth > 900) {
              itemsPerRow = 3; // Show 3 items per row for even larger screens
            }
            double itemWidth =
                constraints.maxWidth / itemsPerRow - 16; // Calculate item width

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Horizontal scroll
              child: Row(
                children: List.generate(dataList.length, (index) {
                  var data = dataList[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    // Add margin between items
                    child: Container(
                      width: itemWidth, // Dynamically calculated item width
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200], // Background color for each item
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(AppImages.alishadoe),
                            ),
                            title: CustomText(
                              title: data["name"],
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                            subtitle: Row(
                              children: [
                                Text(data["location"]),
                                SizedBox(width: 5),
                                Text(data["time"]),
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
                            padding: const EdgeInsets.only(left: 16.0),
                            child: CustomText(
                              title: data["description"],
                              maxLines: 3,
                              fontSize: 17,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
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
                                  title: data["followers"],
                                  fontSize: 14,
                                  color: AppColors.black100,
                                ),
                                Image.asset(AppImages.sms, height: 20, width: 20),
                                SizedBox(width: 3),
                                CustomText(
                                  title: data["comments"],
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
                                  title: data["shares"],
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
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _chainSuggestion(String imagePath, String name, String username, BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Adjust card width based on screen size
    double cardWidth = width * 0.4;  // Adjust card width to be 60% of screen width

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // Horizontal spacing between cards
      child: Container(
        constraints: BoxConstraints(maxWidth: cardWidth), // Ensure maximum width for card
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0), // Prevent overflow
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(imagePath), // Dynamic image
                  ),
                  SizedBox(height: 6),  // Reduced fixed height spacing
                  CustomText(
                    title: name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 6),  // Reduced fixed height spacing
                  CustomText(title:
                    username,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Follow'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
