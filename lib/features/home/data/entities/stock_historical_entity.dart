class StockHistoricalEntity {
  final DateTime date;
  final double openPrice;
  final double highPrice;
  final double lowPrice;
  final double closePrice;
  final int volume;

  StockHistoricalEntity(
      {required this.date,
      required this.openPrice,
      required this.highPrice,
      required this.lowPrice,
      required this.closePrice,
      required this.volume});
}
List<StockHistoricalEntity> exampleData = [
  StockHistoricalEntity(date: DateTime(2024, 9, 1), openPrice: 100.0, highPrice: 50.0, lowPrice: 99.0, closePrice: 50.0, volume: 1000),
  StockHistoricalEntity(date: DateTime(2024, 9, 2), openPrice: 104.0, highPrice: 107.0, lowPrice: 102.0, closePrice: 59.0, volume: 1100),
  StockHistoricalEntity(date: DateTime(2024, 9, 3), openPrice: 106.0, highPrice: 110.0, lowPrice: 105.0, closePrice: 109.0, volume: 1200),
  StockHistoricalEntity(date: DateTime(2024, 9, 4), openPrice: 109.0, highPrice: 111.0, lowPrice: 107.0, closePrice: 40.0, volume: 1150),
  StockHistoricalEntity(date: DateTime(2024, 9, 5), openPrice: 110.0, highPrice: 112.0, lowPrice: 108.0, closePrice: 111.0, volume: 1250),
  StockHistoricalEntity(date: DateTime(2024, 9, 6), openPrice: 111.0, highPrice: 113.0, lowPrice: 109.0, closePrice: 112.0, volume: 1300),
  StockHistoricalEntity(date: DateTime(2024, 9, 7), openPrice: 112.0, highPrice: 114.0, lowPrice: 110.0, closePrice: 70.0, volume: 1350),
  StockHistoricalEntity(date: DateTime(2024, 9, 8), openPrice: 113.0, highPrice: 115.0, lowPrice: 111.0, closePrice: 114.0, volume: 1400),
  StockHistoricalEntity(date: DateTime(2024, 9, 9), openPrice: 114.0, highPrice: 116.0, lowPrice: 112.0, closePrice: 200.0, volume: 1450),
  StockHistoricalEntity(date: DateTime(2024, 9, 10), openPrice: 115.0, highPrice: 117.0, lowPrice: 113.0, closePrice: 116.0, volume: 1500),
  StockHistoricalEntity(date: DateTime(2024, 9, 11), openPrice: 116.0, highPrice: 118.0, lowPrice: 114.0, closePrice: 67.0, volume: 1550),
  StockHistoricalEntity(date: DateTime(2024, 9, 12), openPrice: 117.0, highPrice: 119.0, lowPrice: 115.0, closePrice: 118.0, volume: 1600),
  StockHistoricalEntity(date: DateTime(2024, 9, 13), openPrice: 118.0, highPrice: 120.0, lowPrice: 116.0, closePrice: 140.0, volume: 1650),
  StockHistoricalEntity(date: DateTime(2024, 9, 14), openPrice: 119.0, highPrice: 121.0, lowPrice: 117.0, closePrice: 80.0, volume: 1700),
  StockHistoricalEntity(date: DateTime(2024, 9, 15), openPrice: 120.0, highPrice: 122.0, lowPrice: 118.0, closePrice: 150.0, volume: 1750),
  StockHistoricalEntity(date: DateTime(2024, 9, 16), openPrice: 121.0, highPrice: 123.0, lowPrice: 119.0, closePrice: 122.0, volume: 1800),
  StockHistoricalEntity(date: DateTime(2024, 9, 17), openPrice: 122.0, highPrice: 124.0, lowPrice: 120.0, closePrice: 40.0, volume: 1850),
  StockHistoricalEntity(date: DateTime(2024, 9, 18), openPrice: 123.0, highPrice: 125.0, lowPrice: 121.0, closePrice: 55.0, volume: 1900),
  StockHistoricalEntity(date: DateTime(2024, 9, 19), openPrice: 124.0, highPrice: 126.0, lowPrice: 122.0, closePrice: 65.0, volume: 1950),
  StockHistoricalEntity(date: DateTime(2024, 9, 20), openPrice: 125.0, highPrice: 127.0, lowPrice: 123.0, closePrice: 45.0, volume: 2000),
  StockHistoricalEntity(date: DateTime(2024, 9, 21), openPrice: 126.0, highPrice: 128.0, lowPrice: 124.0, closePrice: 35.0, volume: 2050),
  StockHistoricalEntity(date: DateTime(2024, 9, 22), openPrice: 127.0, highPrice: 129.0, lowPrice: 125.0, closePrice: 35.0, volume: 2100),
  StockHistoricalEntity(date: DateTime(2024, 9, 23), openPrice: 128.0, highPrice: 130.0, lowPrice: 126.0, closePrice: 129.0, volume: 2150),
  StockHistoricalEntity(date: DateTime(2024, 9, 24), openPrice: 129.0, highPrice: 131.0, lowPrice: 127.0, closePrice: 130.0, volume: 2200),
  StockHistoricalEntity(date: DateTime(2024, 9, 25), openPrice: 130.0, highPrice: 132.0, lowPrice: 128.0, closePrice: 131.0, volume: 2250),
  StockHistoricalEntity(date: DateTime(2024, 9, 26), openPrice: 131.0, highPrice: 133.0, lowPrice: 129.0, closePrice: 132.0, volume: 2300),
  StockHistoricalEntity(date: DateTime(2024, 9, 27), openPrice: 132.0, highPrice: 134.0, lowPrice: 130.0, closePrice: 133.0, volume: 2350),
  StockHistoricalEntity(date: DateTime(2024, 9, 28), openPrice: 133.0, highPrice: 135.0, lowPrice: 131.0, closePrice: 134.0, volume: 2400),
  StockHistoricalEntity(date: DateTime(2024, 9, 29), openPrice: 134.0, highPrice: 136.0, lowPrice: 132.0, closePrice: 135.0, volume: 2450),
  StockHistoricalEntity(date: DateTime(2024, 9, 30), openPrice: 135.0, highPrice: 137.0, lowPrice: 133.0, closePrice: 136.0, volume: 2500),
];
