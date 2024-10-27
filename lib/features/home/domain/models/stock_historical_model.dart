class StockHistoricalModel {
  final DateTime date;
  final double openPrice;
  final double highPrice;
  final double lowPrice;
  final double closePrice;
  final int volume;

  StockHistoricalModel({
    required this.date,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.closePrice,
    required this.volume,
  });

  factory StockHistoricalModel.fromJson(Map<String, dynamic> json, String date) {
    return StockHistoricalModel(
      date: DateTime.parse(date),
      openPrice: double.parse(json["1. open"]),
      highPrice: double.parse(json["2. high"]),
      lowPrice: double.parse(json["3. low"]),
      closePrice: double.parse(json["4. close"]),
      volume: int.parse(json["5. volume"]),
    );
  }
}
