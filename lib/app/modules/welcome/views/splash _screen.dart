import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:family_planning/app/core/values/app_colors.dart';
import 'package:family_planning/app/core/values/text_styles.dart';
import 'package:family_planning/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:family_planning/app/modules/welcome/views/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../authentication/controllers/login_controller.dart';
import '../../authentication/views/login_view.dart';
import '../../main/views/bottom_nav_view.dart'; // Since you're using GetX

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final WelcomeController controller = Get.put(WelcomeController());
  bool _isVisible = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      controller.checkLoginStatus();
    });
    Future.delayed(Duration(milliseconds: 800), () {
      setState(() {
        _isVisible = true;
      });
    });


  }
  //
  // Future<void> _checkInternet() async {
  //   var connectivityResult = await Connectivity().checkConnectivity();
  //
  //   if (connectivityResult == ConnectivityResult.none) {
  //     // Show No Internet Screen
  //     Get.off(() => NoInternetView());
  //   } else {
  //     // Navigate to the appropriate screen
  //     Future.delayed(Duration(seconds: 3), () {
  //       if (loginController.userType.value == null) {
  //         Get.off(() => LoginView()); // Navigate to LoginView
  //       } else {
  //         Get.off(() => BottomNavBar()); // Navigate to BottomNavBar
  //       }
  //     });
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(toolbarHeight: 10,backgroundColor: Color(0xFFE0DCFD),),
      backgroundColor: Colors.white,
      body:  Container(
          decoration: BoxDecoration(gradient: AppColors.splashColor),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Column(
                  children: [
                    Text("পরিবার পরিকল্পনা",style: titleTextBlue20,),
                    Text("স্মার্ট মনিটরিং সিস্টেমে",style: titleText20,),
                    Text("আপনাকে স্বাগতম!",style: titleTextBlue20,),
                  ],
                ),
                Spacer(flex: 1,),

                Container(height: screenHeight*.13,width: screenWidth*.5,
                      child: Image.asset('assets/logo.png',)),

              Spacer(),

              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "উদ্যোগ ও বাস্তবায়নে,",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fade(duration: 500.ms).slideY(begin: -0.2, end: 0),

                    SizedBox(height: 8),

                    Text(
                      "মোঃ আবুল কালাম\nউপপরিচালক, চট্টগ্রাম",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
                      textAlign: TextAlign.center,
                    ).animate().fade(duration: 500.ms).scale(delay: 300.ms),

                    SizedBox(height: 6),

                    Text(
                      "ও",
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black),
                      textAlign: TextAlign.center,
                    ).animate().fade(duration: 500.ms).slideY(begin: -0.2, end: 0, delay: 500.ms),
                    SizedBox(height: 6),
                    Text(
                      "নাজমুল হাসান\nসহকারী পরিচালক, চট্টগ্রাম",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
                      textAlign: TextAlign.center,
                    ).animate().fade(duration: 500.ms).scale(delay: 700.ms),
                  ],
                ),
              ),
                Spacer(),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.5,
                      decoration: BoxDecoration(),
                      child: Image.asset(
                        'assets/splash_image.png',
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: screenHeight*.5, // Adjust the height of the fade effect
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.white.withOpacity(1),
                              Colors.white.withOpacity(.95),
                              Colors.white.withOpacity(.85), // Dark fade effect
                              Colors.white.withOpacity(0.7),
                              Colors.white.withOpacity(0.6),
                              Colors.white.withOpacity(0.5),
                              Colors.white.withOpacity(0.4),
                              Colors.white.withOpacity(0.3),
                              Colors.white.withOpacity(0.2),
                              Colors.white.withOpacity(0.1),
                              Colors.transparent
                            ],
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                          duration: Duration(milliseconds: 1000), // Animation duration
                          curve: Curves.easeOut, // Smooth transition effect
                          bottom: _isVisible ? 30 : -screenHeight * 0.2, // Move from bottom to visible position
                          left: screenWidth * 0.1,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 1000),
                            height: screenHeight * .11,
                            width: screenWidth * .8,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "সার্বিক সহযোগিতায়",
                                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.grey),
                                    ),
                                    SizedBox(height: 3,),
                                    Text(
                                      "পরিচালক, পরিবার পরিকল্পনা,\nচট্টগ্রাম বিভাগ, চট্টগ্রাম",textAlign: TextAlign.center,
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10,),
                                    ),
                                    // Center(child: Image.asset("assets/bd logo.png",height: screenHeight*.035,
                                    //   fit: BoxFit.cover,width: 50,))
                                  ],
                                ),
                                // Container(
                                //   width: 1,
                                //   height: screenHeight * .1,
                                //   color: Colors.grey.shade400,
                                // ),
                                Center(child:  Image.asset("assets/bd logo.png",fit: BoxFit.cover,width: 30,)),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "কারিগরি সহায়তায়",
                                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.grey),
                                    ),
                                    SizedBox(height: 3,),
                                    Text(
                                      "mPair Technologies Ltd.",textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                                    ),
                                    Center(child:  Image.asset("assets/mpair.jpg",height: screenHeight*.035,fit: BoxFit.cover,width: 50,))
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                  ],
                ),

              ],
            ),
          ),
        ),

    );
  }
}
