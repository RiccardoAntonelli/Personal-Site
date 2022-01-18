import 'package:flutter/material.dart';
import 'package:personal_site/widgets/painters/painters_utilites.dart';

class ThirdDrawings extends CustomPainter {
  final Animation<double>? _animation;
  final double? _opacity;

  ThirdDrawings(this._animation, this._opacity) : super(repaint: _animation);

  @override
  void paint(Canvas canvas, Size size) {
    List<dynamic> curve = getCurve(size);
    canvas.drawPath(getPathPortion(curve[0], _animation!.value), curve[1]);

    List<dynamic> triangle = getTriangle(size);
    canvas.drawPath(
        getPathPortion(triangle[0], _animation!.value), triangle[1]);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  List<dynamic> getCurve(Size size) {
    final double _xScaling = size.width / 933;
    final double _yScaling = size.height / 533;

    return [
      Path()
        ..moveTo(932 * _xScaling, 1 * _yScaling)
        ..lineTo(
          596 * _xScaling,
          75 * _yScaling,
        )
        ..lineTo(
          394 * _xScaling,
          343 * _yScaling,
        )
        ..lineTo(
          -10 * _xScaling,
          532 * _yScaling,
        ),
      Paint()
        ..color = Colors.pink.withOpacity(_opacity!)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8.0
    ];
  }

  List<dynamic> getTriangle(Size size) {
    final double _xScaling = size.width / 551;
    final double _yScaling = size.height / 400;

    return [
      Path()
        ..moveTo(-10 * _xScaling, 202 * _yScaling)
        ..cubicTo(
          82 * _xScaling,
          300 * _yScaling,
          374.5 * _xScaling,
          317 * _yScaling,
          425 * _xScaling,
          315 * _yScaling,
        )
        ..cubicTo(
          475.5 * _xScaling,
          313 * _yScaling,
          539 * _xScaling,
          298 * _yScaling,
          549 * _xScaling,
          214 * _yScaling,
        )
        ..cubicTo(
          558 * _xScaling,
          138 * _yScaling,
          495 * _xScaling,
          94 * _yScaling,
          442 * _xScaling,
          102 * _yScaling,
        )
        ..cubicTo(
          387 * _xScaling,
          110 * _yScaling,
          349 * _xScaling,
          180 * _yScaling,
          390 * _xScaling,
          214 * _yScaling,
        ),
      Paint()
        ..color = Colors.lime.withOpacity(_opacity!)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8.0
    ];
  }
}
