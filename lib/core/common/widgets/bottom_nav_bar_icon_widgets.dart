import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget bottomNavBarIcon(IconData icon,BuildContext context,String route) {
  final iconSize = MediaQuery.of(context).size.height * 0.04;
  return GestureDetector(
    onTap: () {
      GoRouter.of(context).go('/$route');
    },
    child: Icon(icon,size: iconSize,),
  );
}
