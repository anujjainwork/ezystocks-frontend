import 'package:ezystocks/features/watchlist/business/entities/watchlist_entity.dart';
import 'package:flutter/material.dart';

class WatchlistListView extends StatelessWidget {
  final List<WatchlistEntity> watchlist;

  const WatchlistListView({required this.watchlist});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: watchlist.length,
      itemBuilder: (context, index) {
        final stock = watchlist[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: 8.0),
          child: Card(
            elevation: 2,
            child: ListTile(
              title: Text(
                stock.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(stock.symbol),
              trailing: Text(
                '\$${stock.currentPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}