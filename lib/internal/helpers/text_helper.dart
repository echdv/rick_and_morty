import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';

class TextHelper {
  static TextStyle style14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ThemeHelper.primaryBlack,
    fontFamily: 'Roboto',
    height: 1.42857.h,
    letterSpacing: 0.25.sp,
  );

  static TextStyle style16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ThemeHelper.primaryGrey,
  );

  static TextStyle style14Grey = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ThemeHelper.primaryGrey,
  );

  static TextStyle style14Green = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ThemeHelper.primaryGrey2,
  );

  static TextStyle style16White = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ThemeHelper.primaryWhite,
  );
  static TextStyle style34 = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    color: ThemeHelper.primaryBlack,
  );
  static TextStyle style24 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: ThemeHelper.primaryWhite,
  );

  static TextStyle style20 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: ThemeHelper.primaryWhite,
  );

  /////////////////////////Text Style Search Screen/////////////////////

  static TextStyle span20 = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 20.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    color: ThemeHelper.primaryBlack,
  );
  static TextStyle span14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ThemeHelper.primaryWhite,
  );

  static TextStyle span70 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: ThemeHelper.primaryWhite,
  );
  static TextStyle button18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ThemeHelper.primaryWhite,
  );
}
