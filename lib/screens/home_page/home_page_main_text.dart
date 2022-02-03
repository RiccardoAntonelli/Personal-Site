import 'package:flutter/material.dart';
import 'package:personal_site/theme.dart';

Widget getMainText({required double fontSize, required SiteTheme theme}) {
  return RichText(
    text: TextSpan(
        text: "Hi, I'm ",
        style: TextStyle(
          color: theme.textColor,
          fontSize: fontSize,
        ),
        children: [
          TextSpan(
            text: 'Riccardo Antonelli',
            style: TextStyle(
              color: theme.titleTextColor,
            ),
          ),
          TextSpan(
            text: " and I'm 17.\nI am a ",
            style: TextStyle(
              color: theme.textColor,
            ),
          ),
          TextSpan(
            text: 'full-stack developer',
            style: TextStyle(
              color: theme.titleTextColor,
            ),
          ),
          TextSpan(
            text: ' and a student.',
            style: TextStyle(
              color: theme.textColor,
            ),
          ),
        ]),
  );
}
