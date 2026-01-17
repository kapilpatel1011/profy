
import 'package:get/get.dart';
import 'package:profy/routes/AppRoutes.dart';

class SplashController extends GetxController{

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 3),(){
      Get.offAllNamed(AppRoutes.homescreen);
    });

  }

}
