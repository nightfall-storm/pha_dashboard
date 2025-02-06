import 'package:flutter/material.dart';
import 'package:pharmacy_dashboard/utils/constants/colors.dart';
import 'package:pharmacy_dashboard/features/dashboard/screens/overview/widgets/info_tab_content.dart';

class FeaturesTabs extends StatefulWidget {
  const FeaturesTabs({super.key});

  @override
  State<FeaturesTabs> createState() => _FeaturesTabsState();
}

class _FeaturesTabsState extends State<FeaturesTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final tabWidth = screenSize.width * 0.2; // 20% of screen width for tabs

    return SizedBox(
      height: screenSize.height * 0.6, // 60% of screen height
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: screenSize.width * 0.02), // 2% margin
            child: SizedBox(
              width: tabWidth,
              child: TabBar(
                dividerColor: Colors.transparent,
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: AkColors.primary,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AkColors.secondary,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenSize.width * 0.014, // Responsive font size
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenSize.width * 0.014, // Responsive font size
                ),
                labelPadding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.015, // Responsive padding
                ),
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                tabs: const [
                  Tab(text: 'Info'),
                  Tab(text: 'Diet'),
                  Tab(text: 'Features'),
                ],
              ),
            ),
          ),
          SizedBox(height: screenSize.height * 0.02), // 2% vertical spacing
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                InfoTabContent(),
                Center(child: Text('Diet Content Coming Soon')),
                Center(child: Text('Features Content Coming Soon')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
