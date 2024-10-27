import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget bottomNavBarIcon(IconData icon,BuildContext context,String route) {
  final iconSize = MediaQuery.of(context).size.height * 0.04;
  return IconButton(
    onPressed: () {
      GoRouter.of(context).go('/$route');
    },
    icon: Icon(icon,size: iconSize,),
  );
}
