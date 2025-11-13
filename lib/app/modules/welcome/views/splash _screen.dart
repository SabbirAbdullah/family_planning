
import 'package:family_planning/app/core/values/app_colors.dart';
import 'package:family_planning/app/core/values/text_styles.dart';
import 'package:family_planning/app/modules/welcome/controllers/welcome_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final WelcomeController controller = Get.put(WelcomeController());
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final mediaPadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(toolbarHeight: 0,backgroundColor: const Color(0xFFE0DCFD),),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(gradient: AppColors.splashColor),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                top: mediaPadding.top,


              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.05),

                  const Column(
                    children: [
                      Text("পরিবার পরিকল্পনা", style: titleTextBlue20, textAlign: TextAlign.center),
                      Text("স্মার্ট মনিটরিং সিস্টেমে", style: titleText20, textAlign: TextAlign.center),
                      Text("আপনাকে স্বাগতম!", style: titleTextBlue20, textAlign: TextAlign.center),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  Center(
                    child: SizedBox(
                      height: screenHeight * .13,
                      width: screenWidth * .5,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Image.asset('assets/logo.png'),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "উদ্যোগ ও বাস্তবায়নে,",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ).animate().fade(duration: 500.ms).slideY(begin: -0.2, end: 0),
                      const SizedBox(height: 8),
                      const Text(
                        "মোঃ আবুল কালাম\nউপপরিচালক, চট্টগ্রাম",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
                        textAlign: TextAlign.center,
                      ).animate().fade(duration: 500.ms).scale(delay: 300.ms),
                      const SizedBox(height: 6),
                      const Text(
                        "ও",
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black),
                        textAlign: TextAlign.center,
                      ).animate().fade(duration: 500.ms).slideY(begin: -0.2, end: 0, delay: 500.ms),
                      const SizedBox(height: 6),
                      const Text(
                        "নাজমুল হাসান\nসহকারী পরিচালক, চট্টগ্রাম",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
                        textAlign: TextAlign.center,
                      ).animate().fade(duration: 500.ms).scale(delay: 700.ms),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  Stack(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.4,
                        width: double.infinity,
                        child: Image.asset('assets/splash_image.png', fit: BoxFit.cover),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: List.generate(
                                12,
                                    (index) => Colors.white.withOpacity(1 - index * 0.08),
                              )..add(Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeOut,
                        bottom: _isVisible ? 35 : -screenHeight * 0.2,
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [const BoxShadow(color: Colors.black26, blurRadius: 5)],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "সার্বিক সহযোগিতায়",
                                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.grey),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "পরিচালক, পরিবার পরিকল্পনা,\nচট্টগ্রাম বিভাগ, চট্টগ্রাম",
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Image.asset("assets/bd logo.png", width: 30, fit: BoxFit.cover),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "কারিগরি সহায়তায়",
                                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.grey),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      "mPair Technologies Ltd.",
                                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 4),
                                    Image.asset(
                                      "assets/mpair.jpg",
                                      height: screenHeight * .035,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    )
                                  ],
                                ),
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
        ),
      ),
    );
  }
}
