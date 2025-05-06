import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/view/buttom_navi_bar_view/controller/buttom_navi_controller.dart';
import 'package:social_media/view/chain_view/chain_view.dart';
import 'package:social_media/view/community_view/community_view.dart';
import 'package:social_media/view/home_view/home_view.dart';
import 'package:social_media/view/profile_view/profile_view.dart';

class ButtomNaviBarView extends StatefulWidget {
  const ButtomNaviBarView({super.key});

  @override
  State<ButtomNaviBarView> createState() => _ButtomNaviBarViewState();
}

class _ButtomNaviBarViewState extends State<ButtomNaviBarView> {
  final List<Widget> _screens = [
    HomeView(),
    ChainView(),
    ChainView(),
    CommunityView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final NavigationBarController controller = Get.put(
      NavigationBarController(),
    );
    return Scaffold(
      body: Obx(
        () => _screens[controller.selectedIndex.value],
      ), // Dynamic screen update
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.block), label: "Chain"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "New"),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              label: "Community",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
