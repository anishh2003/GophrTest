import 'package:flutter/material.dart';
import 'package:gophr/ui/components/app_colours.dart';

TextTheme gophrTextTheme() {
  return const TextTheme(
    headline6: TextStyle(
      fontSize: 20,
      fontFamily: 'IBMPlexSans',
      fontStyle: FontStyle.normal,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subtitle1: TextStyle(
      fontSize: 14,
      fontFamily: 'IBMPlexSans',
      fontStyle: FontStyle.normal,
      color: AppColors.black,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.15,
    ),
    subtitle2: TextStyle(
      fontSize: 13,
      fontFamily: 'IBMPlexSans',
      fontStyle: FontStyle.normal,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    button: TextStyle(
      fontSize: 14.0,
      fontFamily: 'IBMPlexSans',
      color: AppColors.black,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.5,
    ),
  );
}
