import 'package:ezystocks/features/search/presentation/bloc/stock_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget searchBarWidget(
    double screenHeight, double screenWidth, BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.025),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: screenHeight * 0.06,
          width: screenWidth * 0.85,
          decoration: BoxDecoration(
            color: Colors.grey[200]!.withOpacity(1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(width: screenWidth * 0.03),
              Icon(Icons.search_outlined),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: TextField(
                  decoration:
                      const InputDecoration.collapsed(hintText: 'Search'),
                  onChanged: (query) {
                    context.read<StockSearchBloc>().add(SearchStocksEvent(query));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
