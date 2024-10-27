import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget displayLogoinAppBar() {
  return Align(
    alignment: Alignment.topCenter,
    child: SvgPicture.asset(
        '/Users/anooj/Desktop/EzyStocks/EzyStocks-frontend/ezystocks/lib/core/assets/images/ezystocks_logo.svg'),
  );
}
