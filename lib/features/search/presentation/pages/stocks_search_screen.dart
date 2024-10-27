import 'package:ezystocks/core/common/widgets/bottom_nav_bar.dart';
import 'package:ezystocks/core/common/widgets/custom_text.dart';
import 'package:ezystocks/features/search/presentation/bloc/stock_search_bloc.dart';
import 'package:ezystocks/features/search/presentation/widgets/stocks_search_bar.dart';
import 'package:ezystocks/features/search/presentation/widgets/stocks_searvch_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockSearch extends StatefulWidget {
  const StockSearch({super.key});

  @override
  State<StockSearch> createState() => _StockSearchState();
}

class _StockSearchState extends State<StockSearch> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: getBottomNavBar(screenHeight, context),
      body: Column(
        children: [
          searchBarWidget(screenHeight, screenWidth, context),
          Expanded(child: searchResultsWidget(screenHeight, screenWidth))
        ],
      ),
    );
  }
}
