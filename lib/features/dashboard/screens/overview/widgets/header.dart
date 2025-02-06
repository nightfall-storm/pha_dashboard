import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_dashboard/utils/constants/colors.dart';
import 'package:pharmacy_dashboard/utils/constants/sizes.dart';

class HeaderController extends GetxController {
  final RxString selectedDuration = 'This Week'.obs;
  
  void changeDuration(String? value) {
    if (value != null) {
      selectedDuration.value = value;
    }
  }
}

class DashboardHeader extends StatelessWidget {
  DashboardHeader({super.key});

  final HeaderController controller = Get.put(HeaderController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Header
        Container(
          padding: const EdgeInsets.all(AkSizes.md),
          // underline border
          // decoration: const BoxDecoration(
          //   color: AkColors.white,
          //   border: Border(
          //     bottom: BorderSide(
          //       color: AkColors.borderPrimary,
          //       width: 1,
          //     ),
          //   ),
          // ),
          child: Row(
            children: [
              // Search Bar
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: AkColors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AkSizes.borderRadiusLg),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: AkColors.black),
                      hintText: 'Search...',
                      hintStyle: const TextStyle(color: AkColors.grey),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AkSizes.md,
                        vertical: AkSizes.sm,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: AkSizes.md),

              // User Profile Image
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AkSizes.borderRadiusLg),
                  image: const DecorationImage(
                    image: AssetImage('assets/logos/user.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: AkSizes.md),

              // Add Button
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: AkColors.primary,
                  borderRadius: BorderRadius.circular(AkSizes.borderRadiusLg),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add, color: AkColors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),

        // Body Header
        Container(
          padding: const EdgeInsets.all(AkSizes.md),
          color: AkColors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title
              Text(
                'Overview',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AkColors.black,
                ),
              ),

              // Right Side Elements
              Row(
                children: [
                  // Dropdown
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: AkSizes.sm),
                    // decoration: BoxDecoration(
                    //   // ignore: deprecated_member_use
                    //   border: Border.all(color: AkColors.grey.withOpacity(0.3)),
                    //   borderRadius: BorderRadius.circular(AkSizes.borderRadiusSm),
                    // ),
                    child: Obx(
                      () => DropdownButton<String>(
                        value: controller.selectedDuration.value,
                        underline: const SizedBox(),
                        items: ['This Week', 'This Month', 'This Year']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: controller.changeDuration,
                      ),
                    ),
                  ),

                  const SizedBox(width: AkSizes.md),

                  // 3-dot menu
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
