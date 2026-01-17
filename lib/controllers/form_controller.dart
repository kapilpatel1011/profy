import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:profy/controllers/data_controller.dart';
import 'package:profy/models/user_profile.dart';
import 'package:profy/routes/AppRoutes.dart';
import 'package:profy/utils/enums.dart';
import 'package:profy/views/widgets/wg_app_dialog.dart';

enum GenderSelection { male, female }

class FormController extends GetxController {
  final DataController dataController = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var formMode = FormMode.add.obs;
  String? userCurrentId;

  var genderSelection = GenderSelection.male.obs;
  void updateGender(GenderSelection? value) {
    if (value != null) {
      genderSelection.value = value;
    }
  }

  void prepareForm({UserProfile? user}) {
    if (user != null) {
      formMode.value = FormMode.edit;
      userCurrentId = user.id;
      nameController.text = user.name!;
      emailController.text = user.email!;
      genderSelection.value = user.gender == "male"
          ? GenderSelection.male
          : GenderSelection.female;
    } else {
      formMode.value = FormMode.add;
      userCurrentId = null;
      nameController.clear();
      emailController.clear();
    }
  }

  void onSubmitForm() {
    if (formKey.currentState!.validate()) {
      UserProfile newUser = UserProfile(
        id: formMode.value == FormMode.edit
            ? userCurrentId!
            : DateTime.now().toString(),
        name: nameController.text,
        email: emailController.text,
        gender: genderSelection.value.name,
      );

      if (formMode.value == FormMode.edit) {
        dataController.updateUser(newUser);
        WgAppDialog.showSuccess(title: "Updated", description: "Details updated successfully", buttonText: "Go to home", onConfirm: ()async{
          Get.back();
         await Get.toNamed(AppRoutes.homescreen);
        });

      } else {
        dataController.addUser(newUser);
        WgAppDialog.showSuccess(title: "Submitted", description: "Form submitted successfully", buttonText: "Go to home", onConfirm: () async{
          Get.back();
         await Get.toNamed(AppRoutes.homescreen);
        });

      }
    } else {
      Get.snackbar("failed", "Form submited failed");
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    nameController.dispose();
    emailController.dispose();

    super.onClose();
  }
}
