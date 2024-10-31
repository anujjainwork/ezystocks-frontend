import 'package:intl/intl.dart';

class DataPredictionEntity {
  final String symbol;
  final String date; 

  DataPredictionEntity({
    required this.symbol,
    required this.date,
  });

  DateTime get parsedDate => DateFormat('yyyy-MM-dd').parse(date);

}
