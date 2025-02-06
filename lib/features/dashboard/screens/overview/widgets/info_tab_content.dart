// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pharmacy_dashboard/utils/constants/colors.dart';

class InfoTabContent extends StatelessWidget {
  const InfoTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final availableWidth = screenWidth - 64;
    final isSmallScreen = screenWidth <= 1180;
    final cardWidth =
        isSmallScreen ? availableWidth - 44 : (availableWidth - (30 * 3)) / 8;
    final cardHeight = isSmallScreen ? 80.0 : cardWidth * 0.6;

    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: constraints.maxWidth,
            minHeight: constraints.minHeight,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 44.0),
            child: isSmallScreen
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: cardHeight.toDouble(),
                        child: _buildMetricCard(
                          icon: Icons.monitor_weight_outlined,
                          value: '65 kg',
                          label: 'Weight',
                          backgroundColor: Colors.blue.shade50,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: cardHeight.toDouble(),
                        child: _buildMetricCard(
                          icon: Icons.nightlight_round,
                          value: '7h 30m',
                          label: 'Sleep',
                          backgroundColor: Colors.red.shade50,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: cardHeight.toDouble(),
                        child: _buildMetricCard(
                          icon: Icons.height,
                          value: '187 cm',
                          label: 'Height',
                          backgroundColor: Colors.red.shade50,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: cardHeight.toDouble(),
                        child: _buildMetricCard(
                          icon: Icons.favorite,
                          value: '102 BPM',
                          label: 'Pulse',
                          backgroundColor: Colors.blue.shade500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: (cardHeight * 2.1).toDouble(),
                        child: _buildNotesCard(),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: cardWidth.toDouble(),
                                height: cardHeight.toDouble(),
                                child: _buildMetricCard(
                                  icon: Icons.monitor_weight_outlined,
                                  value: '65 kg',
                                  label: 'Weight',
                                  backgroundColor: Colors.blue.shade50,
                                ),
                              ),
                              const SizedBox(width: 12),
                              SizedBox(
                                width: cardWidth.toDouble(),
                                height: cardHeight.toDouble(),
                                child: _buildMetricCard(
                                  icon: Icons.nightlight_round,
                                  value: '7h 30m',
                                  label: 'Sleep',
                                  backgroundColor: Colors.red.shade50,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              SizedBox(
                                width: cardWidth.toDouble(),
                                height: cardHeight.toDouble(),
                                child: _buildMetricCard(
                                  icon: Icons.height,
                                  value: '187 cm',
                                  label: 'Height',
                                  backgroundColor: Colors.red.shade50,
                                ),
                              ),
                              const SizedBox(width: 12),
                              SizedBox(
                                width: cardWidth.toDouble(),
                                height: cardHeight.toDouble(),
                                child: _buildMetricCard(
                                  icon: Icons.favorite,
                                  value: '102 BPM',
                                  label: 'Pulse',
                                  backgroundColor: Colors.blue.shade500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: (cardWidth * 1.3).toDouble(),
                        height: (cardHeight * 2.1).toDouble(),
                        child: _buildNotesCard(),
                      ),
                    ],
                  ),
          ),
        ),
      );
    });
  }

  Widget _buildMetricCard({
    required IconData icon,
    required String value,
    required String label,
    required Color backgroundColor,
  }) {
    final bool isPulse = label == 'Pulse';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: isPulse ? Colors.white.withOpacity(0.3) : Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isPulse ? Colors.white : Colors.blue.shade700,
              size: 16,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FittedBox(
                  child: Text(
                    value,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isPulse ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                FittedBox(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 11,
                      color: isPulse
                          ? Colors.white.withOpacity(0.8)
                          : Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Notes',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _buildNoteItem('Add appointment', true),
          const SizedBox(height: 6),
          _buildNoteItem('Add tablets', true),
          const SizedBox(height: 6),
          _buildNoteItem('Set a goal', false),
          const SizedBox(height: 6),
          _buildNoteItem('Add new weight', false),
        ],
      ),
    );
  }

  Widget _buildNoteItem(String text, bool isChecked) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isChecked ? Icons.check_circle : Icons.circle_outlined,
          color: isChecked ? AkColors.secondary : Colors.grey,
          size: 18,
        ),
        const SizedBox(width: 8),
        FittedBox(
          child: Text(
            text,
            style: TextStyle(
              color: isChecked ? AkColors.primary : Colors.grey,
              fontSize: 13,
              fontWeight: isChecked ? FontWeight.w500 : FontWeight.normal,
              decoration: isChecked
                  ? TextDecoration.lineThrough
                  : TextDecoration.none, // Added line strike for checked items
            ),
          ),
        ),
      ],
    );
  }
}
