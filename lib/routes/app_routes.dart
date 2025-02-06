import 'package:get/get.dart';
import 'package:pharmacy_dashboard/features/dashboard/screens/overview/overview.dart';

import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: AkRoutes.home, page: () => const OverviewScreen()),
  ];
}