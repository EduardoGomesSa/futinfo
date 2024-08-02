import 'package:flutter/material.dart';
import 'package:futinfo/src/bindings/futinfo_binding.dart';
import 'package:futinfo/src/pages/base_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      initialBinding: FutinfoBinding(),
      home: const BasePage(),
    );
  }
}

