
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../pages/details/details_page.dart';
import '../pages/home/home_page.dart';
import 'binding.dart';

class AppPages {
  static const String Home = '/home';
  static const String Details = '/details';

  static var list = [
    GetPage(
      name: Home,
      page: () => HomePage(),
      binding: Binding(),
    ),
    GetPage(
      name: Details,
      page: () => DetailsPage(),
      binding: Binding(),
    ),
  ];
}

