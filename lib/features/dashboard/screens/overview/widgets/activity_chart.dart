import 'package:flutter/material.dart';
import 'package:pharmacy_dashboard/utils/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';

class ActivityChart extends StatelessWidget {
  const ActivityChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      height: 250,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.start,
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: 10,
                  color: AkColors.primary,
                  // width: 20,
                  borderRadius: BorderRadius.circular(4),
                ),
                BarChartRodData(
                  toY: 7,
                  color: AkColors.primary,
                  // width: 20,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: 15,
                  color: AkColors.primary,
                  // width: 20,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  toY: 10,
                  color: AkColors.primary,
                  // width: 20,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}