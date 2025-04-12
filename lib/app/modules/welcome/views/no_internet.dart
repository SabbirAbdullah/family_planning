import 'package:family_planning/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../authentication/controllers/login_controller.dart';
import '../../authentication/views/login_view.dart';
import '../../main/views/bottom_nav_view.dart';

class NoInternetView extends StatefulWidget {
  @override
  State<NoInternetView> createState() => _NoInternetViewState();
}

class _NoInternetViewState extends State<NoInternetView> {
  // final WelcomeController controller = Get.find();
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/no internet gif.json"), // Use your animation file
            SizedBox(height: 20),
            Text(
              "No Internet Connection",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // controller.checkConnectivity();
              },
              child: Text("Retry"),
            )
          ],
        ),
      )

    );
  }
}
