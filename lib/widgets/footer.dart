import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_site/theme.dart';

class Footer extends StatelessWidget {
  const Footer(
      {Key? key,
      required this.theme,
      required this.width,
      required this.height,
      required this.isMobile})
      : super(key: key);
  final SiteTheme theme;
  final double width, height;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMobile ? 30 : 50,
      width: double.infinity,
      color: theme.thirdBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              FlutterLogo(
                size: isMobile ? width / 25 : width / 100,
              ),
              const SizedBox(width: 10),
              Text(
                AppLocalizations.of(context)!.footerMadeWith,
                style: TextStyle(
                    color: theme.textColor,
                    fontSize: isMobile ? width / 38 : width / 100),
              ),
            ],
          ),
          SelectableText(
            AppLocalizations.of(context)!.footerEmail,
            style: TextStyle(
                color: theme.textColor,
                fontSize: isMobile ? width / 38 : width / 100),
          ),
        ],
      ),
    );
  }
}
