import 'package:ezystocks/core/common/widgets/bottom_nav_bar.dart';
import 'package:ezystocks/core/common/widgets/custom_text.dart';
import 'package:ezystocks/features/home/business/entities/stock_historical_entity.dart';
import 'package:ezystocks/features/home/presentation/historical_data_bloc/stock_historical_bloc.dart';
import 'package:ezystocks/features/home/presentation/home_bloc/home_bloc.dart';
import 'package:ezystocks/features/home/presentation/widgets/historical_data_chart.dart';
import 'package:ezystocks/core/common/widgets/logo_display_widget.dart';
import 'package:ezystocks/features/home/presentation/widgets/searchbar_widget.dart';
import 'package:ezystocks/features/home/presentation/widgets/stock_price_data.dart';
import 'package:ezystocks/features/home/presentation/widgets/user_stocks_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomePortfolioDataFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        bottomNavigationBar: getBottomNavBar(screenHeight, context),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(height: screenHeight * 0.01),
            displayLogoinAppBar(),
            SizedBox(height: screenHeight * 0.04),
            searchbarHomeWidget(screenHeight,screenWidth,context),
            SizedBox(height: screenHeight * 0.05),
            // createDataChart(exampleData,screenWidth),
            BlocConsumer<StockHistoricalBloc, StockHistoricalState>(
              listener: (context, state) {
                if (state is StockHistoricalError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is StockHistoricalLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is StockHistoricalLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: screenHeight*0.03),
                      child: 
                      CustomTextWidget(
                        text: '${state.symbol}',
                        fontSize: screenHeight * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                      ),                    
                      SizedBox(
                          height:
                              screenHeight * 0.001), // Use SizedBox for spacing
                      createDataChart(state.stockHistoricalData, screenWidth),
                      // Stock price data below the chart
                      getStockPriceData(
                          state.stockHistoricalData, screenHeight),
                    ],
                  );

                } else {
                  return const SizedBox();
                }
              },
            ),
            SizedBox(height: screenHeight * 0.02),
            BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                if (state is HomeError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return showUserStocksList(
                      state, screenWidth); // Pass the state
                }
              },
            ),
          ],
        )));
  }
}
