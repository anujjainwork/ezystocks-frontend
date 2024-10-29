import 'package:ezystocks/core/common/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget searchbarHomeWidget(double screenHeight, double screenWidth,BuildContext context) {
  return GestureDetector(
    onTap: () {
      GoRouter.of(context).go('/search');
    },
    child: Container(
      height: screenHeight * 0.06,
      width: screenWidth * 0.8,
      decoration: BoxDecoration(
          color: Colors.grey[200]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),),

      child: Row(
        children: [
        SizedBox(width: screenWidth*0.03,),
        const Icon(Icons.search_outlined,),
        SizedBox(width: screenWidth*0.03,),
        const CustomTextWidget(text: 'Search',color: Colors.black,)
      ],),
    ),
  );
}
