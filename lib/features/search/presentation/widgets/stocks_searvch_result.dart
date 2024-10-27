import 'package:ezystocks/core/common/widgets/custom_text.dart';
import 'package:ezystocks/features/search/presentation/bloc/stock_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget searchResultsWidget(double screenHeight, double screenWidth) {
  return BlocBuilder<StockSearchBloc, StockSearchState>(
    builder: (context, state) {
      if (state is StockSearchLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is StockSearchLoaded) {
        return Scrollbar(
          thumbVisibility: true, // Always show the scrollbar thumb
          radius: Radius.circular(10), // Rounded edges for the scrollbar thumb
          thickness: 6.0, // Width of the scrollbar thumb
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.02,
              horizontal: screenWidth * 0.03,
            ),
            itemCount: state.stockLists.length,
            itemBuilder: (context, index) {
              final stock = state.stockLists[index];
              return ListTile(
                title: CustomTextWidget(text: stock.name, color: Colors.black),
                subtitle: CustomTextWidget(text: stock.symbol, color: Colors.grey),
              );
            },
          ),
        );
      } else if (state is StockSearchError) {
        return Center(
          child: CustomTextWidget(
            text: 'Error: ${state.errorMessage}',
            color: Colors.red,
          ),
        );
      }
      return const Center(
        child: CustomTextWidget(
          text: 'Start typing to search for stocks',
          color: Colors.grey,
        ),
      );
    },
  );
}
