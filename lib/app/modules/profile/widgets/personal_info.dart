import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/profile_controller.dart';

class PersonalInfo extends StatelessWidget {
   PersonalInfo({super.key});
   final ProfileController controller = Get.put(ProfileController());
   final TextEditingController textController = TextEditingController();
   final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
   var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.appColor, // Replace with your AppBar's background color
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: AppBar(
            toolbarHeight: 80,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('profile'.tr),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
          Center(child:       ClipOval(
              child: homeController.user.value?.image != null &&
                  homeController.user.value!.image!.isNotEmpty
                  ? Image.network(
                "https://family-planning-server.mpairproject.xyz/uploads/${homeController.user.value!.image}",
                width: 100, // Set your desired width
                height: 100, // Set your desired height
                fit: BoxFit.cover,
              )
                  : Icon(Icons.person)
          )),
            SizedBox(height: 16,),
            Center(
              child: Column(

                children: [
                  Text('employee_name'.tr,style: titleTextBlue16,),
                  SizedBox(height: 6,),
                  Text("${homeController.user.value!.name}",),
                  SizedBox(height: 12,),
                  Text('mobile_number'.tr,style: titleTextBlue16,),
                  SizedBox(height: 6,),
                  Text("${homeController.user.value!.mobile}",),
                  SizedBox(height: 12,),
                  Text('nid_number'.tr,style: titleTextBlue16,),
                  SizedBox(height: 6,),
                  Text("${homeController.user.value!.nid}",)
                ],
              ),
            ),


          ]
        ),
      ),
    );
  }
}

class TextInputField extends StatelessWidget {
  final TextEditingController ? textController;
  final int? maxLines;
  final bool? readOnly;
  final String ? text;

  const TextInputField({
    Key? key,
    this.text,
    this.textController,
    this.maxLines = 1, this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            readOnly: readOnly!,
            cursorColor: AppColors.appColor,cursorHeight: 20 ,
            maxLines:maxLines ,
            style: formFieldText18,

            controller: textController,
            decoration: InputDecoration(
              hintText:text ,
              contentPadding: const EdgeInsets.only(
                  left: 16, right: 8, top: 8, bottom: 0),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderSide:
                BorderSide(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}