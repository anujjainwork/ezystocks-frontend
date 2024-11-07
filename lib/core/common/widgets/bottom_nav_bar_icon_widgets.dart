import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

/// Function for creating an IconData bottom navigation icon
Widget bottomNavBarIcon(BuildContext context, IconData iconData, String route) {
  final iconSize = MediaQuery.of(context).size.height * 0.04;

  return GestureDetector(
    onTap: () {
      GoRouter.of(context).go('/$route');
    },
    child: Icon(
      iconData,
      size: iconSize,
    ),
  );
}
