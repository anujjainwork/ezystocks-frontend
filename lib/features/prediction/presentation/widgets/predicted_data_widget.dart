import 'package:ezystocks/core/common/widgets/custom_text.dart';
import 'package:ezystocks/features/prediction/presentation/bloc/datapred_bloc.dart';
import 'package:ezystocks/features/prediction/presentation/widgets/price_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

Widget getPredictedData(double screenHeight, double screenWidth,
    DatapredLoaded state, BuildContext context) {
  DateTime parsedDate = DateTime.parse(state.date);

  String formattedDate = DateFormat('d').format(parsedDate) +
      getDaySuffix(parsedDate.day) +
      ' ' +
      DateFormat('MMMM y').format(parsedDate);

  return Column(
    children: [
      SizedBox(height: screenHeight * 0.025),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(
              text: 'On $formattedDate',
              fontWeight: FontWeight.w600,
              fontSize: screenHeight * 0.02,
            ),
            GestureDetector(
              onTap: () {
                context.read<DatapredBloc>().add(
                    SetDatapredInitialEvent()); // Correctly instantiate the event
              },
              child: Icon(
                Icons.refresh,
                size: screenHeight * 0.04,
              ),
            )
          ],
        ),
      ),
      SizedBox(height: screenHeight * 0.02),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: GridView.count(
          shrinkWrap:
              true, // Makes sure the GridView doesn't take up more space than needed
          physics: NeverScrollableScrollPhysics(), // Prevent scrolling
          crossAxisCount: 2, // Two columns
          children: [
            buildPriceBox(
                "Close Price",
                state.dataPredicitionResponseEntity.closePrice,
                screenHeight,
                screenWidth),
            buildPriceBox(
                "High Price",
                state.dataPredicitionResponseEntity.highPrice,
                screenHeight,
                screenWidth),
            buildPriceBox(
                "Low Price",
                state.dataPredicitionResponseEntity.lowPrice,
                screenHeight,
                screenWidth),
            buildPriceBox(
                "Open Price",
                state.dataPredicitionResponseEntity.openPrice,
                screenHeight,
                screenWidth),
          ],
        ),
      ),
    ],
  );
}

// Helper function to get the suffix for the day
String getDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
