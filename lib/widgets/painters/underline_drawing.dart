import 'package:flutter/material.dart';
import 'package:personal_site/widgets/painters/painters_utilites.dart';

class UnderlineDrawing extends CustomPainter {
  final Animation<double>? _animation;
  final double? _opacity;
  final Color? _color;

  UnderlineDrawing(this._animation, this._opacity, this._color)
      : super(repaint: _animation);

  @override
  void paint(Canvas canvas, Size size) {
    List<dynamic> line = getLine(size);
    canvas.drawPath(getPathPortion(line[0], _animation!.value), line[1]);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  List<dynamic> getLine(Size size) {
    final double _width = size.width;
    final double _height = size.height;

    return [
      Path()
        ..moveTo(0, _height)
        ..lineTo(_width, _height),
      Paint()
        ..color = _color!.withOpacity(_opacity!)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4.0
    ];
  }
}
