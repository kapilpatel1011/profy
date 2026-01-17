import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:profy/bindings/form_binding.dart';
import 'package:profy/routes/AppRoutes.dart';
import 'package:profy/views/form/form_screen.dart';
import 'package:profy/views/home/home_screen.dart';
import 'package:profy/views/splash/splash_screen.dart';

class AppPages{

  static final pages = [
 GetPage(name: AppRoutes.splashscreen, page:()=> SplashScreen()),
 GetPage(name: AppRoutes.homescreen, page:()=> HomeScreen()),
 GetPage(name: AppRoutes.formscreen, page:()=> FormScreen(), binding: FormBinding()),


  ];



}