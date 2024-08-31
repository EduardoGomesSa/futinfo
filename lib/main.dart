import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:futinfo/src/bindings/futinfo_binding.dart';
import 'package:futinfo/src/controllers/theme_controller.dart';
import 'package:futinfo/src/core/routes/app_routes_pages.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await dotenv.load(fileName: "assets/.env");
  Get.put(ThemeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Obx(() {
      return GetMaterialApp(
        title: 'FutInfos',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
          appBarTheme: AppBarTheme(backgroundColor: Colors.blue.shade400),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withAlpha(870),
          )
        ),
        themeMode: themeController.themeMode.value,
        darkTheme: ThemeData.dark().copyWith(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.shade800,
          )    
        ),
        debugShowCheckedModeBanner: false,
        initialBinding: FutinfoBinding(),
        initialRoute: AppRoutes.base,
        getPages: AppPages.pages,
      );
    });
  }
}
