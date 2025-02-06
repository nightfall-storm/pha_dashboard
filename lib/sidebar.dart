import 'package:flutter/material.dart';
import 'package:pharmacy_dashboard/utils/constants/sizes.dart';
import 'utils/constants/colors.dart';
import 'utils/constants/image_strings.dart';
import 'package:get/get.dart';

class SidebarController extends GetxController {
  var currentRoute = '/dashboard'.obs;

  void updateRoute(String route) {
    currentRoute.value = route;
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final SidebarController controller = Get.put(SidebarController());
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    double drawerWidth = screenWidth *
        (screenWidth < 600 ? 0.75 : 0.25); // Adjust width for smaller screens

    double iconSize = screenWidth < 600 ? 20 : 24; // Responsive icon size
    double textSize = screenWidth < 600 ? 14 : 16; // Responsive text size
    double paddingSize =
        screenWidth < 600 ? 8 : AkSizes.md; // Responsive padding

    Widget buildListTile(
        {required IconData icon,
        required String title,
        required String routeName}) {
      return Column(
        children: [
          Obx(() {
            bool isActive = controller.currentRoute.value == routeName;
            return ListTile(
              leading: Icon(icon,
                  size: iconSize,
                  color: isActive ? AkColors.primary : AkColors.grey),
              title: Text(
                title,
                style: TextStyle(
                  fontSize: textSize,
                  color: isActive ? AkColors.primary : AkColors.grey,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
              horizontalTitleGap: 15,
              dense: true,
              onTap: () {
                if (!isActive) {
                  controller.updateRoute(routeName);
                  Get.toNamed(routeName);
                }
              },
            );
          }),
          SizedBox(height: AkSizes.spaceBtwItems), // Add spacing between tiles
        ],
      );
    }

    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        width: drawerWidth,
        decoration: const BoxDecoration(
          color: AkColors.white,
          border: Border(
            right: BorderSide(
              color: AkColors.borderPrimary,
              width: 1,
            ),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxHeight <= 538.0) {
              // When height is small, make everything scrollable
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image(
                            image: AssetImage(AkImages.lightAppBarLogo),
                            width: 70,
                            height: 70),
                        Text(
                          'Medical',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),

                    // General Section
                    Padding(
                      padding: EdgeInsets.all(paddingSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              'General',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: AkColors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          SizedBox(height: AkSizes.spaceBtwItems * 1.5),

                          // Dashboard
                          buildListTile(
                              icon: Icons.dashboard_outlined,
                              title: 'Dashboard',
                              routeName: '/dashboard'),

                          // Calendar
                          buildListTile(
                              icon: Icons.calendar_today_outlined,
                              title: 'Calendar',
                              routeName: '/calendar'),

                          // Appointments
                          buildListTile(
                              icon: Icons.event_note_outlined,
                              title: 'Appointments',
                              routeName: '/appointments'),

                          // Statistics
                          buildListTile(
                              icon: Icons.bar_chart_outlined,
                              title: 'Statistics',
                              routeName: '/statistics'),
                        ],
                      ),
                    ),

                    // Tools Section
                    Padding(
                      padding: EdgeInsets.all(paddingSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: AkSizes.spaceBtwSections / 2),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              'Tools',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: AkColors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          SizedBox(height: AkSizes.spaceBtwItems * 1.5),

                          // Chat
                          buildListTile(
                              icon: Icons.chat_outlined,
                              title: 'Chat',
                              routeName: '/chat'),

                          // Support
                          buildListTile(
                              icon: Icons.support_agent_outlined,
                              title: 'Support',
                              routeName: '/support'),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Button
                    Padding(
                      padding: EdgeInsets.all(paddingSize),
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Container(
                          padding: screenWidth < 1308
                              ? EdgeInsets.all(6)
                              : EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: AkColors.secondary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            size: screenWidth < 1308 ? 16 : iconSize,
                            color: AkColors.white,
                          ),
                        ),
                        label: Wrap(
                          children: [
                            Text(
                              screenWidth < 1308
                                  ? 'New Appt.'
                                  : 'New Appointment',
                              style: TextStyle(
                                fontSize: screenWidth < 1308
                                    ? 11
                                    : (screenWidth < 600 ? 12 : textSize),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: screenWidth < 1308 ? 4 : 8),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size.fromHeight(screenWidth < 1308 ? 50 : 60),
                          backgroundColor: AkColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: screenWidth < 1308
                              ? EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 12)
                              : EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 16),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              // Original layout for normal height
              return Column(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image(
                                image: AssetImage(AkImages.lightAppBarLogo),
                                width: 70,
                                height: 70),
                            Text(
                              'Medical',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),

                        // General Section
                        Padding(
                          padding: EdgeInsets.all(paddingSize),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  'General',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: AkColors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              SizedBox(height: AkSizes.spaceBtwItems * 1.5),

                              // Dashboard
                              buildListTile(
                                  icon: Icons.dashboard_outlined,
                                  title: 'Dashboard',
                                  routeName: '/dashboard'),

                              // Calendar
                              buildListTile(
                                  icon: Icons.calendar_today_outlined,
                                  title: 'Calendar',
                                  routeName: '/calendar'),

                              // Appointments
                              buildListTile(
                                  icon: Icons.event_note_outlined,
                                  title: 'Appointments',
                                  routeName: '/appointments'),

                              // Statistics
                              buildListTile(
                                  icon: Icons.bar_chart_outlined,
                                  title: 'Statistics',
                                  routeName: '/statistics'),
                            ],
                          ),
                        ),

                        // Tools Section
                        Padding(
                          padding: EdgeInsets.all(paddingSize),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(height: AkSizes.spaceBtwItems),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  'Tools',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: AkColors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              SizedBox(height: AkSizes.spaceBtwItems),

                              // Chat
                              buildListTile(
                                  icon: Icons.chat_outlined,
                                  title: 'Chat',
                                  routeName: '/chat'),

                              // Support
                              buildListTile(
                                  icon: Icons.support_agent_outlined,
                                  title: 'Support',
                                  routeName: '/support'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.all(paddingSize),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Container(
                        padding: screenWidth < 1308
                            ? EdgeInsets.all(6)
                            : EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: AkColors.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          size: screenWidth < 1308 ? 16 : iconSize,
                          color: AkColors.white,
                        ),
                      ),
                      label: Wrap(
                        children: [
                          Text(
                            screenWidth < 1308
                                ? 'New Appt.'
                                : 'New Appointment',
                            style: TextStyle(
                              fontSize: screenWidth < 1308
                                  ? 11
                                  : (screenWidth < 600 ? 12 : textSize),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenWidth < 1308 ? 4 : 8),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size.fromHeight(screenWidth < 1308 ? 50 : 60),
                        backgroundColor: AkColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: screenWidth < 1308
                            ? EdgeInsets.symmetric(vertical: 15, horizontal: 12)
                            : EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
