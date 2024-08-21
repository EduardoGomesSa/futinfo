import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:futinfo/src/bindings/futinfo_binding.dart';
import 'package:futinfo/src/core/routes/app_routes_pages.dart';
import 'package:get/get.dart';

Future<void> main() async {
  print('Current working directory: ${Directory.current.path}');
  await dotenv.load(fileName: "assets/.env");

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
          appBarTheme: AppBarTheme(backgroundColor: Colors.blue.shade400)),
      debugShowCheckedModeBanner: false,
      initialBinding: FutinfoBinding(),
      initialRoute: AppRoutes.base,
      getPages: AppPages.pages,
    );
  }
}
