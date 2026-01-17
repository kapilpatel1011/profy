import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profy/controllers/data_controller.dart';
import 'package:profy/controllers/form_controller.dart';
import 'package:profy/routes/AppRoutes.dart';
import 'package:profy/utils/app_constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final DataController dataController = Get.find();
  final FormController formController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        actions: [
          IconButton(
            onPressed: () {
              formController.prepareForm();
              Get.toNamed(AppRoutes.formscreen);
            },
            icon: Icon(Icons.add),
          ),
          SizedBox(width: 10.h),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (dataController.userProfiles.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.hourglass_empty_outlined,size: 50.sp,color: AppConstants.secondaryTextColor,),
                      Text("No Data here !"),
                      Text("click on + icon to add"),
                    ],
                  ),
                );
              }
              return ListView.builder(
                itemCount: dataController.userProfiles.length,
                itemBuilder: (context, index) {
                  final user = dataController.userProfiles[index];
                  return ListTile(
                    title: Text("Name: ${user.name}"),
                    subtitle: Text(
                      "email: ${user.email} gender: ${user.gender}",
                    ),
                    leading: Icon(Icons.person_2_outlined),
                    trailing: IconButton(
                      onPressed: () {

                        formController.prepareForm(user:user);
                        Get.toNamed(AppRoutes.formscreen);
                      },
                      icon: Icon(Icons.edit_outlined),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
