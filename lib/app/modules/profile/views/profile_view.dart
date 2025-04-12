import 'package:family_planning/app/core/values/text_styles.dart';
import 'package:family_planning/app/modules/home/controllers/home_controller.dart';
import 'package:family_planning/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../authentication/controllers/login_controller.dart';
import '../../help&report/views/help_report.dart';
import '../widgets/conditions.dart';
import '../widgets/forget_pass.dart';
import '../widgets/guidelines.dart';
import '../widgets/leave_day_info.dart';
import '../widgets/personal_info.dart';
import '../widgets/privacy_policy.dart';

class ProfileView extends StatelessWidget {
   ProfileView({super.key});
final ProfileController controller = Get.put(ProfileController());
   final LoginController loginController = Get.put(LoginController());
   final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,),
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(80),
      //   child: Container(
      //     decoration: const BoxDecoration(
      //       color: AppColors.appColor, // Replace with your AppBar's background color
      //       borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(16),
      //         bottomRight: Radius.circular(16),
      //       ),
      //     ),
      //     child: AppBar(
      //       toolbarHeight: 80,
      //       scrolledUnderElevation: 0,
      //       backgroundColor: Colors.transparent,
      //       elevation: 0,
      //       title: Text('profile'.tr),
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                homeController.user.value == null
                    ? Expanded(
                  child: Text(
                    "User Not Found",
                    style: titleTextBlue20,
                  ),
                )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${homeController.user.value!.name}",
                      style: titleTextBlue20,
                    ),
                    Row(
                      children: [
                        Text(
                          "${homeController.user.value!.designation}",
                          style: titleTextBlue14,
                        ),
                        SizedBox(width: 6),
                        Icon(Icons.circle, size: 10),
                        SizedBox(width: 6),
                        Text(
                          "${homeController.user.value!.unionName}",
                          style: titleTextBlue14,
                        ),
                        SizedBox(width: 6),
                        Icon(Icons.circle, size: 10),
                        SizedBox(width: 6),
                        Text(
                          "${homeController.user.value!.empId}",
                          style: titleTextBlue14,
                        ),
                      ],
                    )
                  ],
                ),
                ClipOval(
                  child: homeController.user.value?.image != null &&
                homeController.user.value!.image!.isNotEmpty
                  ? Image.network(
                    "https://family-planning-server.mpairproject.xyz/uploads/${homeController.user.value!.image}",
                    width: 100, // Set your desired width
                    height: 100, // Set your desired height
                    fit: BoxFit.cover,
                  )
                      : Icon(Icons.person)
                )
              ],
            ),

            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Get.to(()=>PersonalInfo());
              },
              child: Container(width: double.infinity,
                decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.circular(10),),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.person,color: AppColors.appColor,size: 25,),
                    SizedBox(width: 10,),
                    Text('personal_info'.tr,style: grayTitleText14_500,)
                  ],
                ) ,
              ),
            ),
            SizedBox(height: 8,),

            InkWell(
              onTap: (){
                Get.to(()=>LeaveDayInfo());
              },
              child: Container( width: double.infinity,
                decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(10),),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset("assets/images/leave 1.png",height: 25,width: 25,color: AppColors.appColor,),
                    SizedBox(width: 10,),
                    Text('leave_application'.tr,style: grayTitleText14_500,)
                  ],
                ) ,
              ),
            ),
            SizedBox(height: 8,),

            InkWell(
              onTap: (){
                Get.to(()=> HelpReportView());
              },
              child: Container(

                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(10),),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset("assets/images/report.png",height: 25,width: 25,color: AppColors.appColor,),
                    SizedBox(width: 10,),
                    Text('help_report'.tr,style: grayTitleText14_500,)
                  ],
                ) ,
              ),
            ),
            SizedBox(height: 8,),

            InkWell(
              onTap: (){
                Get.to(()=>ForgetPassView());
              },
              child: Container( width: double.infinity,
                decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(10),),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset("assets/images/password.png",height: 25,width: 25,color: AppColors.appColor,),
                    SizedBox(width: 10,),
                    Text('change_password'.tr,style: grayTitleText14_500,)
                  ],
                ) ,
              ),
            ),
            SizedBox(height: 8,),
            InkWell(
              onTap: (){
                Get.to(()=>PrivacyPolicyPage());
              },
              child: Container( width: double.infinity,
                decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(10),),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset("assets/images/privacy policy.png",height: 25,width: 25,color: AppColors.appColor,),
                    SizedBox(width: 10,),
                    Text('privacy_policy'.tr,style: grayTitleText14_500,)
                  ],
                ) ,
              ),
            ),
            SizedBox(height: 8,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(left: 16,right: 16,bottom: 4,top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Expanded(
                     child: Row(
                        children: [
                          Icon(Icons.language, color: AppColors.appColor, size: 25),
                          SizedBox(width: 10),
                          Text(
                            'change_language'.tr,
                            style:grayTitleText14_500 ,
                          ),
                        ],
                      ),),

                     Obx(() => Container(
                       child: DropdownButton<String>(
                         underline: SizedBox.shrink(),
                          value: controller.selectedLanguage.value.languageCode,
                          icon: Icon(Icons.arrow_forward_ios),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              controller.changeLanguage(newValue);
                            }
                          },
                          iconSize: 20,
                          style: grayTitleText14_500,
                          dropdownColor: Colors.white,

                          items: [
                            DropdownMenuItem(
                              value: 'bn',
                              child: Text('বাংলা'),
                            ),
                            DropdownMenuItem(
                              value: 'en',
                              child: Text('English'),
                            ),
                          ],
                        ),
                     )),

                ],
              ),
            ),
            SizedBox(height: 8,),
            Divider(color: Color(0xffe0e0e0),),
            SizedBox(height: 8,),

            InkWell(
              onTap: ()async{
                loginController.logout();

              },
              child: Container( width: double.infinity,
                decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(10),),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset("assets/images/logout.png",height: 25,width: 25,color: Colors.grey,),
                    SizedBox(width: 10,),
                    Text("logout".tr,style: grayTitleText14_500,)
                  ],
                ) ,
              ),
            ),
            Spacer(),
            Container(
              width:screenWidth*.9 ,
                child: Column(

                    children: [
                      Row( mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector( onTap: ()=> Get.to(()=>ConditionsPage()),
                              child: Text("conditions".tr,style: titleTextBlue14,)),
                          SizedBox(width: 20,),
                          GestureDetector(onTap: ()=> Get.to(()=> GuidelinesPage()),
                              child: Text("guidelines".tr,style: titleTextBlue14,))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Developed By ",style: grayTitleText14,),
                          Text("mPair Technologies Ltd.",style: TextStyle(color: Colors.blue,fontSize: 14,fontWeight: FontWeight.w400),),
                        ],
                      )
                    ],
                  ),
              ),
            SizedBox(height: 20,)

          ],
        ),
      ),
    );
  }
}
