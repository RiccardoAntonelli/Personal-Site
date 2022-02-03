import 'package:flutter/material.dart';

@immutable
class SiteTheme {
  final Color? firstBackgroundColor;
  final Color? secondBackgroundColor;
  final Color? thirdBackgroundColor;
  final Color? appBarButtonColor;
  final Color? appBarIconColor;
  final Color? titleTextColor;
  final Color? secondTitleTextColor;
  final Color? textColor;
  final Color? buttonTextColor;
  final double? drawingsOpacity;

  const SiteTheme(
      {this.firstBackgroundColor,
      this.secondBackgroundColor,
      this.thirdBackgroundColor,
      this.appBarButtonColor,
      this.appBarIconColor,
      this.titleTextColor,
      this.secondTitleTextColor,
      this.textColor,
      this.buttonTextColor,
      this.drawingsOpacity});

  factory SiteTheme.dark() {
    return const SiteTheme(
      firstBackgroundColor: Color(0xFF202020),
      secondBackgroundColor: Color(0xFF2B2B2B),
      thirdBackgroundColor: Color(0xFF3C3C3C),
      appBarButtonColor: Color(0xFF445427),
      appBarIconColor: Color(0xFFFFFFFF),
      titleTextColor: Color(0xFFFFFFFF),
      secondTitleTextColor: Color(0xFFBCBCBC),
      textColor: Color(0xB3FFFFFF),
      buttonTextColor: Color(0xFFFFFFFF),
      drawingsOpacity: 0.4,
    );
  }

  factory SiteTheme.light() {
    return const SiteTheme(
        firstBackgroundColor: Color(0xFFFAFAFA),
        secondBackgroundColor: Color(0xFFFBFBFB),
        thirdBackgroundColor: Color(0xFFF3F3F3),
        appBarButtonColor: Color(0xFFA4BF73),
        appBarIconColor: Color(0xFF212121),
        titleTextColor: Color(0xFF000000),
        secondTitleTextColor: Color(0xFF373737),
        textColor: Color(0x8A000000),
        buttonTextColor: Color(0xFF000000),
        drawingsOpacity: 0.8);
  }

  bool isDark() =>
      firstBackgroundColor == const Color(0xFF202020) ? true : false;

  bool isLight() =>
      firstBackgroundColor == const Color(0xFFFAFAFA) ? true : false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SiteTheme &&
          firstBackgroundColor == other.firstBackgroundColor &&
          appBarButtonColor == other.appBarButtonColor &&
          appBarIconColor == other.appBarIconColor;

  @override
  int get hashCode =>
      firstBackgroundColor.hashCode ^
      appBarButtonColor.hashCode ^
      appBarIconColor.hashCode;
}
