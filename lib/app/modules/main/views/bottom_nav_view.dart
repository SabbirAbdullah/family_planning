
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:family_planning/app/modules/attendance_list/views/attendance_list_view.dart';
import 'package:family_planning/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../attendance_list/views/attendance_history.dart';
import '../../home/views/home_view.dart';
import '../../welcome/controllers/welcome_controller.dart';
import '../../welcome/views/no_internet.dart';
import '../controllers/bottom_nav_controller.dart';


class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final BottomNavController controller = Get.put(BottomNavController());
  @override
  void initState() {
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.selectedIndex(index);
        },
        children: [
          AttendanceHistoryPage(),
          HomeView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: Obx(() => CurvedNavigationBar(
        index: controller.selectedIndex.value,
        onTap: (index) {
          controller.changePage(index);
        },
        letIndexChange: (index) => true,
        items: [
          CurvedNavigationBarItem(
            label: "attendance".tr,
            labelStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
            child: Image.asset("assets/icons/image 1 copy 3.png",
                height: 22, width: 22, color: Colors.white),
          ),
          CurvedNavigationBarItem(
            label: "home".tr,
            labelStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
            child: SvgPicture.asset("assets/icons/home.svg",
                height: 20, width: 20, color: Colors.white),
          ),
          CurvedNavigationBarItem(
            label: "profile".tr,
            labelStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
            child: SvgPicture.asset("assets/icons/profile.svg",
                height: 20, width: 20, color: Colors.white),
          ),
        ],
        color: AppColors.appColor,
        buttonBackgroundColor: AppColors.appColor,
        backgroundColor: AppColors.pageBackground,
        animationCurve: Curves.easeInOut,
        height: 65,
        iconPadding: 20,
        animationDuration: Duration(milliseconds: 300),
      )),
    );
  }
}


