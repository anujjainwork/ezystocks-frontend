import 'package:ezystocks/core/common/widgets/bottom_nav_bar_icon_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget getBottomNavBar(double screenHeight, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 4,
          offset: const Offset(0, -2),
        ),
      ],
    ),
    child: BottomAppBar(
      shape: const CircularNotchedRectangle(),
      height: screenHeight * 0.045,
      color: Colors.white,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            bottomNavBarIcon(context, Icons.home, "/"),
            bottomNavBarIcon(context, Icons.watch_later_outlined, "watchlist"),
            bottomNavBarIcon(context, Icons.auto_graph_outlined, "prediction"),
            bottomNavBarIcon(context, Icons.wallet, "wallet"),
          ]),
    ),
  );
}
