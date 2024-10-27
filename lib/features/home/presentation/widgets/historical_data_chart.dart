import 'package:ezystocks/features/home/business/entities/stock_historical_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget createDataChart(
    List<StockHistoricalEntity> historicalData, double screenWidth) {
  if (historicalData.isEmpty) {
    return const Center(child: Text("No data available"));
  }

  List<StockHistoricalEntity> filteredData =
      historicalData.where((entry) => entry.closePrice.isFinite).toList();

  if (filteredData.isEmpty) {
    return const Center(child: Text("No valid data available"));
  }

  double minY =
      filteredData.map((e) => e.closePrice).reduce((a, b) => a < b ? a : b);
  double maxY =
      filteredData.map((e) => e.closePrice).reduce((a, b) => a > b ? a : b);

  minY = minY * 0.95;
  maxY = maxY * 1.05;

  List<FlSpot> spots = filteredData.asMap().entries.map((entry) {
    return FlSpot(entry.key.toDouble(), entry.value.closePrice);
  }).toList();

  double minX = 0;
  double maxX = (filteredData.length - 1).toDouble();

  List<String> dateLabels = filteredData.map((entry) {
    DateTime date = entry.date;
    return DateFormat('dd/MM').format(date);
  }).toList();

  return Container(
    width: screenWidth,
    height: 200,
    child: LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
              getTitlesWidget: (value, meta) {
                int index = value.toInt();
                if (index >= 0 && index < dateLabels.length) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 4.0,
                    child: Text(dateLabels[index]),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false), // Remove the border
        minX: minX,
        maxX: maxX,
        minY: minY,
        maxY: maxY,
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: Color.fromRGBO(224, 20, 76, 1), 
            barWidth: 2,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: Color.fromRGBO(224, 20, 76, 0.5),
              gradient: LinearGradient(
                colors: [Color.fromRGBO(224, 20, 76, 0.5),Color.fromRGBO(224, 20, 76, 0),],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
