import 'package:flutter/material.dart';
import 'package:personal_site/widgets/painters/painters_utilites.dart';

class RRectDrawing extends CustomPainter {
  final Animation<double>? _animation;
  final double? _opacity;
  final Color? _color;

  RRectDrawing(this._animation, this._opacity, this._color)
      : super(repaint: _animation);

  @override
  void paint(Canvas canvas, Size size) {
    List<dynamic> rRect = getRRect(size);
    canvas.drawPath(getPathPortion(rRect[0], _animation!.value), rRect[1]);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  List<dynamic> getRRect(Size size) {
    final double _width = size.width + 40;
    final double _height = size.height + 40;

    return [
      Path()
        ..moveTo(0, 0)
        ..addRRect(RRect.fromLTRBR(
            -20, -20, _width, _height, const Radius.circular(20))),
      Paint()
        ..color = _color!.withOpacity(_opacity!)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8.0
    ];
  }
}
