import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import 'dart:js' as js;

class LinkButton extends StatelessWidget {
  final String url, buttonText;
  final Color? backgroundColor, textColor;
  final MdiIconData icon;

  const LinkButton(
      {Key? key,
      required this.url,
      required this.backgroundColor,
      required this.textColor,
      required this.icon,
      required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        elevation: 5.0,
        padding: const EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {
        js.context.callMethod('open', [url]);
      },
      child: Row(
        children: [
          Icon(
            icon,
            color: textColor,
          ),
          const SizedBox(width: 15),
          Text(
            buttonText,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 1.6,
                fontFamily: 'OpenSans'),
          ),
        ],
      ),
    );
  }
}
