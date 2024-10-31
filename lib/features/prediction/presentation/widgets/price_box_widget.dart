import 'package:ezystocks/core/common/widgets/custom_text.dart';
import 'package:flutter/material.dart';

Widget buildPriceBox(String title, double value, double screenHeight, double screenWidth) {
  return Card(
    elevation: 4,
    margin: EdgeInsets.all(screenWidth * 0.02),
    child: Padding(
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextWidget(
            text: title,
            fontWeight: FontWeight.bold,
            fontSize: screenHeight * 0.02,
          ),
          SizedBox(height: screenHeight * 0.01),
          CustomTextWidget(
            text: value.toString(),
            fontWeight: FontWeight.w600,
            fontSize: screenHeight * 0.018,
          ),
        ],
      ),
    ),
  );
}
