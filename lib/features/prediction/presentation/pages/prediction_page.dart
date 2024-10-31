import 'package:ezystocks/core/common/widgets/bottom_nav_bar.dart';
import 'package:ezystocks/core/common/widgets/custom_text.dart';
import 'package:ezystocks/core/common/widgets/logo_display_widget.dart';
import 'package:ezystocks/features/home/presentation/widgets/historical_data_chart.dart';
import 'package:ezystocks/features/prediction/business/usecases/data_pred_usecase.dart';
import 'package:ezystocks/features/prediction/presentation/bloc/datapred_bloc.dart';
import 'package:ezystocks/features/prediction/presentation/bloc/prediction_graph_bloc.dart';
import 'package:ezystocks/features/prediction/presentation/widgets/enter_symbol_date_widget.dart';
import 'package:ezystocks/features/prediction/presentation/widgets/predicted_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({super.key});

  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: getBottomNavBar(screenHeight, context),
      body: SafeArea(

        child:SingleChildScrollView(
        child: BlocConsumer<DatapredBloc, DatapredState>(
          listener: (context, state) {
            // Optionally, handle side effects based on state changes
          },
          builder: (context, datapredState) {
            // Initialize a list to store the widgets
            List<Widget> widgetList = [];

            // Add the common header to the widget list
            widgetList.addAll([
              SizedBox(height: screenHeight * 0.01),
              displayLogoinAppBar(),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CustomTextWidget(
                    text: "Predict your\nstocks.",
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.05,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
            ]);

            // Handle DatapredBloc states
            if (datapredState is DatapredInitial) {
              widgetList.add(
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: DataPredictionInputWidget(),
                ),
              );
            } else if (datapredState is DatapredLoaded) {
              // Move createDataChart above the loaded message
              widgetList.add(
                BlocBuilder<PredictionGraphBloc, PredictionGraphState>(
                  builder: (context, predictionGraphState) {
                    if (predictionGraphState is PredictionGraphLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (predictionGraphState is PredictionGraphLoaded) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenHeight * 0.03),
                            child: CustomTextWidget(
                              text: '${predictionGraphState.symbol}',
                              fontSize: screenHeight * 0.03,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.002),
                          createDataChart(
                              predictionGraphState.stockHistoricalData,
                              screenWidth)
                        ],
                      );
                    } else if (predictionGraphState is PredictionGraphError) {
                      return Center(child: Text(predictionGraphState.message));
                    }
                    // Default case, return an empty widget
                    return SizedBox.shrink();
                  },
                ),
              );
              widgetList.add(
                getPredictedData(screenHeight,screenWidth,datapredState,context),
              );
            } else if (datapredState is DatapredError) {
              widgetList.add(
                Center(child: Text(datapredState.message)),
              );
            }

            // Return the complete widget list inside a Column
            return Column(
              children: widgetList,
            );
          },
        ),
      ),
      ),
    );
  }
}
