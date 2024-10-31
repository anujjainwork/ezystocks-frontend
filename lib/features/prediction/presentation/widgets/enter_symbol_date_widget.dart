import 'package:ezystocks/core/common/widgets/custom_text.dart';
import 'package:ezystocks/features/prediction/presentation/bloc/datapred_bloc.dart';
import 'package:ezystocks/features/search/presentation/bloc/stock_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ezystocks/features/prediction/data/models/data_predicition_model.dart';

class DataPredictionInputWidget extends StatefulWidget {
  @override
  _DataPredictionInputWidgetState createState() =>
      _DataPredictionInputWidgetState();
}

class _DataPredictionInputWidgetState extends State<DataPredictionInputWidget> {
  final TextEditingController _symbolController = TextEditingController();
  DateTime? _selectedDate;
  bool _isListOpen = false;

  @override
  void dispose() {
    _symbolController.dispose();
    super.dispose();
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)), // Start from tomorrow
      firstDate: DateTime.now().add(Duration(days: 1)), // Future dates only
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _submitPredictionRequest(BuildContext context) {
    if (_symbolController.text.isNotEmpty && _selectedDate != null) {
      final String symbol = _symbolController.text.split(' ').first;
      final String formattedDate =
          DateFormat('yyyy-MM-dd').format(_selectedDate!);

      final dataPredictionModel =
          DataPredictionModel(symbol: symbol, date: formattedDate);

      context
          .read<DatapredBloc>()
          .add(FetchDataPrediction(dataPredictionModel));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please enter a symbol and select a future date'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        // Use SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<StockSearchBloc, StockSearchState>(
              builder: (context, state) {
                return TextField(
                  controller: _symbolController,
                  style: const TextStyle(
                      color: Colors.black), // Set text color to black
                  decoration: InputDecoration(
                    labelText: 'Enter Stock Symbol',
                    labelStyle: const TextStyle(
                        color: Colors.black), // Set label text color to black
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      // Set focused border to black
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      // Set enabled border to black
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    suffixIcon: IconButton(
                      icon:
                          const Icon(Icons.calendar_today, color: Colors.black),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                  onChanged: (query) {
                    context
                        .read<StockSearchBloc>()
                        .add(SearchStocksEvent(query));
                    _isListOpen = !_isListOpen;
                  },
                );
              },
            ),
            SizedBox(height: 16),
            BlocBuilder<StockSearchBloc, StockSearchState>(
              builder: (context, state) {
                if (state is StockSearchLoaded &&
                    _symbolController.text.isNotEmpty &&
                    _isListOpen) {
                  return Container(
                    // Use a container with a constrained height
                    height: 200, // Set a fixed height for the dropdown list
                    child: ListView(
                      shrinkWrap: true,
                      children: state.stockLists
                          .map((stock) => ListTile(
                                title: Text('${stock.name} (${stock.symbol})'),
                                onTap: () {
                                  setState(() {
                                    _symbolController.text = stock.symbol;
                                    _isListOpen = !_isListOpen;
                                  });
                                },
                              ))
                          .toList(),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                _submitPredictionRequest(context);
              },
              child: Center(
                child: Container(
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: Center(
                      child: CustomTextWidget(
                        text: 'Predict',
                        color: Colors.white,
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
