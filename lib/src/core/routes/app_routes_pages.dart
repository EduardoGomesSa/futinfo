import 'package:futinfo/src/pages/base_page.dart';
import 'package:futinfo/src/pages/home/home_page.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.base,
      page: () => const BasePage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
    ),
  ];
}

abstract class AppRoutes {
  static const String base = '/';
  static const String home = '/home';
}
