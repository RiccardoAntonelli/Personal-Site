import 'package:flutter/material.dart';

class AdaptiveBuilder extends StatefulWidget {
  const AdaptiveBuilder(
      {Key? key,
      required this.desktopLayout,
      required this.mobileLayout,
      this.threshold})
      : super(key: key);
  final Widget desktopLayout, mobileLayout;
  final double? threshold;

  @override
  State<AdaptiveBuilder> createState() => _AdaptiveBuilderState();
}

class _AdaptiveBuilderState extends State<AdaptiveBuilder> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.biggest.width > (widget.threshold ?? 600)) {
          return widget.desktopLayout;
        } else {
          return widget.mobileLayout;
        }
      },
    );
  }
}
