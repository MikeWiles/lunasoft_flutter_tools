import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExternalFonts {
  static TextStyle pageHeader1([Color? color, FontWeight? weight]) {
    return _basicTextStyle(32,
        weight==null?FontWeight.w400:weight,
        color==null?Colors.black.withOpacity(0.5):color);
  }

  static TextStyle pageError1([Color? color, FontWeight? weight]) {
    return _basicTextStyle(14,
        weight==null?FontWeight.w500:weight,
        color==null?Colors.red.withOpacity(0.9):color);
  }

  static TextStyle subtitle1([Color? color, FontWeight? weight]) {
    return _basicTextStyle(12,
        weight==null?FontWeight.w400:weight,
        color==null?Colors.black.withOpacity(0.9):color);
  }

  static TextStyle cardHeader1([Color? color]) {
    return _basicTextStyle(16,
        FontWeight.w600,
        color==null?Colors.black.withOpacity(0.9):color);
  }

  static TextStyle cardSubheading1([Color? color]) {
    return _basicTextStyle(14,
        FontWeight.w600,
        color==null?Colors.black.withOpacity(0.75):color);
  }

  static TextStyle cardContent1([Color? color]) {
    return _basicTextStyle(12,
        FontWeight.w600,
        color==null?Colors.black.withOpacity(0.5):color);
  }

  static _basicTextStyle(double size, FontWeight? weight, Color? color) {
    return TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color);
  }
}