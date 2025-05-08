import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantBarShopView extends StatefulWidget {
  const RestaurantBarShopView({super.key});

  @override
  State<RestaurantBarShopView> createState() => _RestaurantBarShopViewState();
}

class _RestaurantBarShopViewState extends State<RestaurantBarShopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Restaurant Bar & Shop",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
          )
        ],
      ),
    );
  }
}
