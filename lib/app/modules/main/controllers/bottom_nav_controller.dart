
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class BottomNavController extends GetxController {

// Reactive index for the selected tab
  var selectedIndex = 1.obs;

// List of page widgets for navigation
//   final pages = [
//     AttendanceListView(),
//     HomeView(),
//     ProfileView()
//   ];

  PageController pageController = PageController(initialPage: 1);

  void changePage(int index) {
    selectedIndex.value = index;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

// Update the selected index

}








