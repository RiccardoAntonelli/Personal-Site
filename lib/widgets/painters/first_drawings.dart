import 'package:flutter/material.dart';
import 'package:personal_site/widgets/painters/painters_utilites.dart';

class FirstDrawings extends CustomPainter {
  final Animation<double>? _animation;
  final double? _opacity;

  FirstDrawings(this._animation, this._opacity) : super(repaint: _animation);

  @override
  void paint(Canvas canvas, Size size) {
    List<dynamic> curve = getCurve(size);
    canvas.drawPath(getPathPortion(curve[0], _animation!.value), curve[1]);

    List<dynamic> line = getLine(size);
    canvas.drawPath(getPathPortion(line[0], _animation!.value), line[1]);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  List<dynamic> getCurve(Size size) {
    final double _xScaling = size.width / 714;
    final double _yScaling = size.height / 304;

    return [
      Path()
        ..moveTo(-10, 141 * _yScaling)
        ..cubicTo(
          105 * _xScaling,
          220 * _yScaling,
          224 * _xScaling,
          232 * _yScaling,
          341 * _xScaling,
          141 * _yScaling,
        )
        ..cubicTo(
          458 * _xScaling,
          50 * _yScaling,
          715 * _xScaling,
          141 * _yScaling,
          715 * _xScaling,
          141 * _yScaling,
        ),
      Paint()
        ..color = Colors.orange.withOpacity(_opacity!)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8.0
    ];
  }

  List<dynamic> getLine(Size size) {
    final double _xScaling = size.width / 714;
    final double _yScaling = size.height / 304;

    return [
      Path()
        ..moveTo(70 * _xScaling, 0)
        ..lineTo(1500 * _xScaling, 1000 * _yScaling),
      Paint()
        ..color = Colors.lime.withOpacity(_opacity!)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8.0
    ];
  }
}
