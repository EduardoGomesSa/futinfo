import 'package:flutter/material.dart';
import 'package:futinfo/src/bindings/futinfo_binding.dart';
import 'package:futinfo/src/core/routes/app_routes_pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FutInfos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue.shade400)
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: FutinfoBinding(),
      initialRoute: AppRoutes.base,
      getPages: AppPages.pages,
    );
  }
}

