import 'package:get/get.dart';
import 'package:profy/controllers/splash_controller.dart';

import '../controllers/data_controller.dart';
import '../controllers/form_controller.dart';


class InitialBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashController>(() => SplashController());
    Get.put(DataController(), permanent: true);
    Get.lazyPut<FormController>(()=>FormController());



  }
}