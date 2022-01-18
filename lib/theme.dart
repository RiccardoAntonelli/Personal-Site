import 'package:flutter/material.dart';

class SiteTheme {
  final Color? firstBackgroundColor;
  final Color? secondBackgroundColor;
  final Color? appBarButtonColor;
  final Color? appBarIconColor;
  final Color? titleTextColor;
  final Color? textColor;
  final Color? buttonTextColor;
  final double? drawingsOpacity;

  SiteTheme(
      {this.firstBackgroundColor,
      this.secondBackgroundColor,
      this.appBarButtonColor,
      this.appBarIconColor,
      this.titleTextColor,
      this.textColor,
      this.buttonTextColor,
      this.drawingsOpacity});

  factory SiteTheme.dark() {
    return SiteTheme(
      firstBackgroundColor: const Color(0xFF212121),
      secondBackgroundColor: const Color(0xFF262626),
      appBarButtonColor: const Color(0xFF445427),
      appBarIconColor: const Color(0xFFFFFFFF),
      titleTextColor: const Color(0xFFFFFFFF),
      textColor: const Color(0xB3FFFFFF),
      buttonTextColor: const Color(0xFFFFFFFF),
      drawingsOpacity: 0.4,
    );
  }

  factory SiteTheme.light() {
    return SiteTheme(
        firstBackgroundColor: const Color(0xFFFAFAFA),
        secondBackgroundColor: const Color(0xFFF2F2F2),
        appBarButtonColor: const Color(0xFFA4BF73),
        appBarIconColor: const Color(0xFF212121),
        titleTextColor: const Color(0xFF000000),
        textColor: const Color(0x8A000000),
        buttonTextColor: const Color(0xFF000000),
        drawingsOpacity: 0.8);
  }

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
