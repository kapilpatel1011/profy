import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profy/bindings/initial_bindings.dart';
import 'package:profy/routes/AppPages.dart';
import 'package:profy/routes/AppRoutes.dart';
import 'package:profy/utils/app_constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const Profy());
}

class Profy extends StatelessWidget {
  const Profy({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'Profy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppConstants.backgroundColor,
          textTheme: GoogleFonts.ubuntuTextTheme(),
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppConstants.primaryColor,
            surface: AppConstants.backgroundColor,
          ),
        ),
        initialRoute: AppRoutes.splashscreen,
        initialBinding: InitialBindings(),
        getPages: AppPages.pages,
      ),
    );
  }
}
