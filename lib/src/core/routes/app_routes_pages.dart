import 'package:futinfo/src/bindings/favoreite_binding.dart';
import 'package:futinfo/src/bindings/futinfo_binding.dart';
import 'package:futinfo/src/pages/base_page.dart';
import 'package:futinfo/src/pages/home/home_page.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.base,
      page: () => const BasePage(),
      bindings: [
        FutinfoBinding(),
        FavoreiteBinding(),
      ]
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
       bindings: [
        FutinfoBinding()
      ]
    ),
  ];
}

abstract class AppRoutes {
  static const String base = '/';
  static const String home = '/home';
}
