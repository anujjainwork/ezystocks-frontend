import 'package:ezystocks/core/common/widgets/custom_text.dart';
import 'package:ezystocks/features/home/data/entities/stock_historical_entity.dart';
import 'package:flutter/material.dart';

Widget getStockPriceData(List<StockHistoricalEntity> historicalData, double screenHeight){
  
  StockHistoricalEntity latestStockHistoricalData = historicalData.first;

  double openPrice = latestStockHistoricalData.openPrice??0;
  double closePrice = latestStockHistoricalData.closePrice??0;
  double highPrice = latestStockHistoricalData.highPrice??0;
  double lowPrice = latestStockHistoricalData.lowPrice??0;
  return Column(
    children: [
      SizedBox(height:screenHeight*0.01),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomTextWidget(text: 'Open Price: ${openPrice.toString()}'),
          CustomTextWidget(text: 'Close Price: ${closePrice.toString()}')
        ],
      ),
      SizedBox(height:screenHeight*0.01),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomTextWidget(text: 'High Price: ${highPrice.toString()}'),
          CustomTextWidget(text: 'Low Price: ${lowPrice.toString()}')
        ],
      ),
    ],
  );
}