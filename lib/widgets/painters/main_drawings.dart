import 'package:flutter/material.dart';
import 'package:personal_site/widgets/painters/painters_utilites.dart';

class MainDrawings extends CustomPainter {
  final Animation<double>? _animation;
  final double? _opacity;

  MainDrawings(this._animation, this._opacity) : super(repaint: _animation);

  @override
  void paint(Canvas canvas, Size size) {
    List<dynamic> firstCurve = getFirstCurve(size);
    canvas.drawPath(
        getPathPortion(firstCurve[0], _animation!.value), firstCurve[1]);

    List<dynamic> triangle = getTriangle(size);
    canvas.drawPath(
        getPathPortion(triangle[0], _animation!.value), triangle[1]);

    List<dynamic> rectangle = getRectangle(size);
    canvas.drawPath(
        getPathPortion(rectangle[0], _animation!.value), rectangle[1]);

    List<dynamic> circle = getCircle(size);
    canvas.drawPath(getPathPortion(circle[0], _animation!.value), circle[1]);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  List<dynamic> getFirstCurve(Size size) {
    final double _xScaling = size.width / 800;
    final double _yScaling = size.height / 600;

    return [
      Path()
        ..moveTo(-10, 252 * _yScaling)
        ..cubicTo(
          22 * _xScaling,
          526 * _yScaling,
          400 * _xScaling,
          606 * _yScaling,
          848 * _xScaling,
          358 * _yScaling,
        ),
      Paint()
        ..color = Colors.red.withOpacity(_opacity!)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8.0
    ];
  }

  List<dynamic> getTriangle(Size size) {
    final double _xScaling = size.width / 800;
    final double _yScaling = size.height / 600;

    return [
      Path()
        ..moveTo(50 * _xScaling, 10 * _yScaling)
        ..addPolygon([
          Offset(50 * _xScaling, 10 * _yScaling),
          Offset(300 * _xScaling, 450 * _yScaling),
          Offset(600 * _xScaling, 150 * _yScaling),
          Offset(49 * _xScaling, 9 * _yScaling),
        ], false),
      Paint()
        ..color = Colors.yellow.withOpacity(_opacity!)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8.0
    ];
  }

  List<dynamic> getRectangle(Size size) {
    final double _xScaling = size.width / 800;
    final double _yScaling = size.height / 600;
    final Offset center = Offset(size.width / 2, size.height / 2);

    return [
      Path()
        ..addRect(Rect.fromCenter(
            center: center, width: 500 * _xScaling, height: 200 * _yScaling)),
      Paint()
        ..color = Colors.green.withOpacity(_opacity!)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8.0
    ];
  }

  List<dynamic> getCircle(Size size) {
    final double _xScaling = size.width / 800;
    final double _yScaling = size.height / 600;
    const double radius = 300;
    final Offset center = Offset(720 * _xScaling, 0.0001 * _yScaling);

    return [
      Path()..addOval(Rect.fromCircle(center: center, radius: radius)),
      Paint()
        ..color = Colors.blue.withOpacity(_opacity!)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8.0
    ];
  }
}
