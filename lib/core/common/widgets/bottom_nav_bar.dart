import 'package:ezystocks/core/common/widgets/bottom_nav_bar_icon_widgets.dart';
import 'package:flutter/material.dart';

Widget getBottomNavBar(double screenHeight,BuildContext context) {
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
        children: [bottomNavBarIcon(Icons.home,context,"/"),
        bottomNavBarIcon(Icons.computer,context,"/wallet"),
        bottomNavBarIcon(Icons.wallet,context,"/wallet"),
        ]
      ),
    ),
  );
}
