import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_dashboard/features/dashboard/screens/overview/overview.dart';

// import 'bindings/general_bindings.dart';
import 'routes/app_routes.dart';
import 'utils/theme/theme.dart';



void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: AkAppTheme.lightTheme,
      darkTheme: AkAppTheme.darkTheme,
      // initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const OverviewScreen(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}