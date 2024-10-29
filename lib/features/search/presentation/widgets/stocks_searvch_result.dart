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
          thumbVisibility: true,
          radius: const Radius.circular(10),
          thickness: 6.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.02,
              horizontal: screenWidth * 0.03,
            ),
            itemCount: state.stockLists.length,
            itemBuilder: (context, index) {
              final stock = state.stockLists[index];
              return Dismissible(
                key: Key(stock.symbol),
                direction: DismissDirection.startToEnd, // Only allow right swipe
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.startToEnd) {
                    showAboutDialog(context: context);
                    // context.read<StockSearchBloc>().add(YourBlocEvent(stock: stock));
                    return false; // Prevent the item from being dismissed
                  }
                  return false;
                },
                background: Container(
                  color: Colors.blue,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
                child: ListTile(
                  title: CustomTextWidget(text: stock.name, color: Colors.black),
                  subtitle: CustomTextWidget(text: stock.symbol, color: Colors.grey),
                ),
              );
            },
          ),
        );
      } else if (state is StockSearchError) {
        return Center(
          child: CustomTextWidget(
            text: 'Error: ${state.errorMessage}',
            fontSize: 12,
            color: Colors.black,
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