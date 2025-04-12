import 'package:flutter/material.dart';

abstract class AppColors {

  static const Color buttonColor = Color(0xFF13007D);
  static const Color pageBackground = Color(0xFFF6F6F6);
  static const Color statusBarColor = Color(0xFF13007D);
  static const Color appColor = Color(0xFF13007D);
  static const Color appBarColor = Color(0xFF13007D);

  static const Color appBarIconColor = Color(0xFFFFFFFF);
  static const Color appBarTextColor = Color(0xFFFFFFFF);

  static const Color centerTextColor = Colors.grey;
  static const MaterialColor colorPrimarySwatch = Colors.cyan;
  static const Color colorPrimary = Color(0xFF38686A);
  static const Color colorAccent = Color(0xFF38686A);
  static const Color colorLightGreen = Color(0xFF00EFA7);
  static const Color colorGreen = Color(0xFF269000);

  static const Color colorWhite = Color(0xFFFFFFFF);
  static const Color lightGreyColor = Color(0xFFC4C4C4);
  static const Color errorColor = Color(0xFFAB0B0B);
  static const Color colorDark = Color(0xFF323232);

  static const Color buttonBgColor = colorPrimary;
  static const Color disabledButtonBgColor = Color(0xFFBFBFC0);
  static const Color defaultRippleColor = Color(0x0338686A);

  static const Color textColorPrimary = Color(0xFF323232);
  static const Color textColorSecondary = Color(0xFF9FA4B0);
  static const Color textColorTag = colorPrimary;
  static const Color textColorGreyLight = Color(0xFFABABAB);
  static const Color textColorGreyDark = Color(0xFF959595);
  static const Color textColorGrey = Color(0xFF6C6C6C);

  static const Color textColorBlueGreyDark = Color(0xFF939699);
  static const Color textColorCyan = Color(0xFF38686A);
  static const Color textColorWhite = Color(0xFFFFFFFF);
  static Color searchFieldTextColor = const Color(0xFF323232).withOpacity(0.5);

  static const Color iconColorDefault = Colors.grey;

  static Color timelineDividerColor = const Color(0x5438686A);
  static Color borderColor = const Color(0xffe8e8e8);
  static Color dividerColor = const Color(0xffcacaca);



  static const Color gradientStartColor = Colors.black87;
  static const Color gradientEndColor = Colors.transparent;
  static const Color silverAppBarOverlayColor = Color(0x80323232);

  static const Color switchActiveColor = colorPrimary;
  static const Color switchInactiveColor = Color(0xFFABABAB);
  static Color elevatedContainerColorOpacity = Colors.grey.withOpacity(0.5);
  static const Color suffixImageColor = Colors.grey;

  static const LinearGradient appBackgroundColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xffe6f9ff),
      Color(0xffe9ffe8),
      Color(0xfffff6e2),
    ],
  );

  static const LinearGradient gradientContainer = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF6F6F6),
      Color(0xFFF6F6F6),
      Color(0xFFFFFFFF),
    ],
  );

  static const LinearGradient splashColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFE0DCFD),
      Color(0x4DFFFFFF),
      Color(0xFFFFFF),
    ],
  );
}
