import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import 'package:personal_site/theme.dart';

class Footer extends StatelessWidget {
  const Footer(
      {Key? key,
      required this.theme,
      required this.width,
      required this.height})
      : super(key: key);
  final SiteTheme theme;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: theme.thirdBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              FlutterLogo(
                size: width / 100,
              ),
              const SizedBox(width: 10),
              Text(
                'Made with Flutter',
                style: TextStyle(color: theme.textColor, fontSize: width / 100),
              ),
            ],
          ),
          SelectableText(
            'Mail - riccardo.antonelli@outlook.com',
            style: TextStyle(color: theme.textColor, fontSize: width / 100),
          ),
        ],
      ),
    );
  }
}
