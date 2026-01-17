import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profy/controllers/form_controller.dart';
import 'package:profy/utils/enums.dart';
import 'package:profy/views/widgets/wg_button.dart';
import 'package:profy/views/widgets/wg_text_field.dart';

class FormScreen extends StatelessWidget {
  FormScreen({super.key});

  final FormController formController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: formController.formMode.value == FormMode.edit
            ? Text("Update Profile")
            : Text("Create Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: formController.formKey,
              child: Column(
                children: [
                  WgTextField(
                    controller: formController.nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "name is required";
                      return null;
                    },
                    labelText: "Enter your name",
                    prefixIcon: Icons.person_2_outlined,
                  ),
                  WgTextField(
                    controller: formController.emailController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains("@"))
                        return "enter valid email";
                      return null;
                    },
                    labelText: "Enter your email",
                    prefixIcon: Icons.email_outlined,
                  ),
                  Obx(() {
                    return RadioGroup<GenderSelection>(
                      groupValue: formController.genderSelection.value,
                      onChanged: (GenderSelection? value) {
                        if (value != null) {
                          formController.genderSelection.value = value;
                        }
                      },
                      child: Row(
                        children: [
                          Radio<GenderSelection>(value: GenderSelection.male),
                          Text("Male"),
                          Radio<GenderSelection>(value: GenderSelection.female),
                          Text("Female"),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            Obx(() {
              return WgButton(
                onTap: () {
                  formController.onSubmitForm();
                },
                text: formController.formMode.value == FormMode.edit? "Update" :"Submit",
                borderRadius: 0,
              );
            }),
          ],
        ),
      ),
    );
  }
}
