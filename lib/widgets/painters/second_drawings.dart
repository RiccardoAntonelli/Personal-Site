import 'package:flutter/material.dart';
import 'package:personal_site/widgets/painters/painters_utilites.dart';

class SecondDrawings extends CustomPainter {
  final Animation<double>? _animation;
  final double? _opacity;

  SecondDrawings(this._animation, this._opacity) : super(repaint: _animation);

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
    final double _xScaling = size.width / 714;
    final double _yScaling = size.height / 304;

    return [
      Path()
        ..moveTo(-10, 141 * _yScaling)
        ..addRRect(RRect.fromRectAndRadius(
            Rect.fromLTWH(210 * _xScaling, 10 * _yScaling, 500 * _xScaling,
                250 * _yScaling),
            const Radius.circular(50))),
      Paint()
        ..color = Colors.teal.withOpacity(_opacity!)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8.0
    ];
  }

  List<dynamic> getTriangle(Size size) {
    final double _xScaling = size.width / 746;
    final double _yScaling = size.height / 505;

    return [
      Path()
        ..moveTo(1045 * _xScaling, 174 * _yScaling)
        ..cubicTo(
          345 * _xScaling,
          -159 * _yScaling,
          87 * _xScaling,
          211 * _yScaling,
          350 * _xScaling,
          514 * _yScaling,
        ),
      Paint()
        ..color = Colors.deepPurple.withOpacity(_opacity!)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8.0
    ];
  }
}
