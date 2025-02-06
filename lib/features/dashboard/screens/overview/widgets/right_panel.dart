import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pharmacy_dashboard/features/dashboard/screens/overview/widgets/calendar_section.dart';
import 'package:pharmacy_dashboard/utils/constants/colors.dart';
import 'package:pharmacy_dashboard/utils/constants/sizes.dart';

class RightPanel extends StatelessWidget {
  const RightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AkSizes.spaceBtwSections * 1.3),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Iconsax.notification5,
                      size: AkSizes.iconMd,
                      color: AkColors.primary,
                    ),
                    onPressed: () {},
                    tooltip: 'Notifications',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const CalendarSection(),
            const SizedBox(height: 16),
            _buildInfoContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoContainer() {
    return Column(
      children: [
        _buildAppointmentCard(
          textColor: AkColors.white,
          icon: Icons.medical_services_outlined,
          iconColor: AkColors.white,
          backgroundColor: AkColors.primary,
          title: 'Pulmonologist',
          time: '10:00-11:00',
          doctor: 'Dr. Cameron Williamson',
        ),
        const SizedBox(height: 12),
        _buildAppointmentCard(
          textColor: AkColors.primary,
          icon: Icons.medical_services_outlined,
          iconColor: AkColors.primary,
          backgroundColor: Colors.grey.shade100,
          title: 'Dentist',
          time: '15:00-15:30',
          doctor: 'Dr. Dianne Russell',
        ),
      ],
    );
  }

  Widget _buildAppointmentCard({
    required IconData icon,
    required Color textColor,
    required Color iconColor,
    required Color backgroundColor,
    required String title,
    required String time,
    required String doctor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligns items to the start
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  doctor,
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
          Column(
            // Wrap the chevron icon in a Column to align it with the text
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.chevron_right,
                color: iconColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
