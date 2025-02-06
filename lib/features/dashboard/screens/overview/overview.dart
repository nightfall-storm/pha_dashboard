import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pharmacy_dashboard/features/dashboard/screens/overview/widgets/activity_chart.dart';
import 'package:pharmacy_dashboard/features/dashboard/screens/overview/widgets/features_tabs.dart';
import 'package:pharmacy_dashboard/features/dashboard/screens/overview/widgets/header.dart';
import 'package:pharmacy_dashboard/features/dashboard/screens/overview/widgets/right_panel.dart';
import 'package:pharmacy_dashboard/sidebar.dart';
// ignore: unused_import
import 'package:iconsax/iconsax.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    double screenWidth = MediaQuery.of(context).size.width;
    log('Width: ${MediaQuery.sizeOf(context).width.toString()}');
    log('Height: ${MediaQuery.sizeOf(context).height.toString()}');
    return Scaffold(
      key: scaffoldKey,
      drawer: screenWidth < 1294 ? Sidebar() : null,
      appBar: screenWidth < 1294 ? AppBar() : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Sidebar
          screenWidth < 1294
              ? const SizedBox.shrink()
              : const Expanded(flex: 1, child: Sidebar()),

          // Main Content
          Expanded(
            flex: 3,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      DashboardHeader(),
                      SizedBox(height: 24),
                      // Body
                      // * Activity chart
                      ActivityChart(),
                      SizedBox(height: 16),
                      // *  Info/Diet/Features tabs
                      FeaturesTabs(),
                      // * Stats cards (weight, sleep, height, BPM)
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Right Panel
          Expanded(
            flex: 2,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    // ignore: deprecated_member_use
                    color: Colors.grey.withOpacity(0.2),
                    width: 1,
                  ),
                ),
              ),
              child: RightPanel(),
            ),
          ),
        ],
      ),
    );
  }
}
