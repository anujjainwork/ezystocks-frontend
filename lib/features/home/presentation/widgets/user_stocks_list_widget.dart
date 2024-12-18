import 'package:ezystocks/core/common/widgets/custom_text.dart';
import 'package:ezystocks/features/home/presentation/historical_data_bloc/stock_historical_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ezystocks/features/home/presentation/home_bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget showUserStocksList(HomeState state, double screenHeight ,double screenWidth) {
  if (state is HomeLoaded) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth*0.03,vertical: screenHeight*0.01), // Adjust padding as needed
            child: CustomTextWidget(
              text: "Your portfolio:",
              fontSize: screenWidth*0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: state.userStocks.length, // Use the userStocks list
              itemBuilder: (context, index) {
                final stock = state.userStocks[index];
                return ListTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<StockHistoricalBloc>(context).add(
                          StockHistoricalFetchDataEvent(symbol: stock.symbol),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            stock.symbol,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16, // You can adjust the size as needed
                            ),
                          ),
                          Text(
                            '\$${stock.currentPrice.toString()}',
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16, // Same size as stock symbol
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  } else {
    return const Center(child: CustomTextWidget(text: 'No stocks available.'));
  }
}
