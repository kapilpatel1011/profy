import 'package:get/get.dart';
import 'package:profy/controllers/form_controller.dart';

class FormBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FormController>(()=>FormController());
  }

}
