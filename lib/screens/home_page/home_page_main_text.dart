import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_site/theme.dart';

Widget getMainText(
    {required double fontSize,
    required SiteTheme theme,
    required BuildContext context}) {
  return RichText(
    text: TextSpan(
        text: AppLocalizations.of(context)!.homePageMainText1,
        style: TextStyle(
          color: theme.textColor,
          fontSize: fontSize,
        ),
        children: [
          TextSpan(
            text: AppLocalizations.of(context)!.homePageMainText2,
            style: TextStyle(
              color: theme.titleTextColor,
            ),
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.homePageMainText3,
            style: TextStyle(
              color: theme.textColor,
            ),
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.homePageMainText4,
            style: TextStyle(
              color: theme.titleTextColor,
            ),
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.homePageMainText5,
            style: TextStyle(
              color: theme.textColor,
            ),
          ),
        ]),
  );
}
