import 'package:flutter/material.dart';

import '../constants/colors.dart';
 

Widget buildMaterialIconCircle(String imagePath, double size) {
  return Container(
    width: size,
    height: size,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color:kPrimaryLight,
    ),
    child: Align(
      alignment: Alignment.center,
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
        width: size * 0.5,
        height: size * 0.5,
      ),
    ),
  );
}
