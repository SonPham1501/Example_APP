import 'dart:math';
import 'package:flutter/material.dart';

import '../../../../../core/ultis/helpers/data_converter.dart';

class PolygonPointWidget extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double score;
  const PolygonPointWidget({
    required this.size,
    required this.backgroundColor,
    required this.textColor,
    required this.fontSize,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final clipPaint = new _PolygonClipPainter(backgroundColor: backgroundColor);
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          child: Container(
            height: size,
            width: size,
            //color: Colors.white,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(50),
            // ),
          ),
          painter: clipPaint,
        ),
        Align(
          alignment: Alignment.center,
          child: ClipPath(
            child: Container(
              width: size - 20,
              height: size - 20,
              decoration: BoxDecoration(
                border: Border.all(),
                color: backgroundColor,
              ),
            ),
            clipper: _MyClipper(),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: RichTextPointWidget(
            score: score,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}

class RichTextPointWidget extends StatelessWidget {
  final double score;
  final double fontSize;
  final Color textColor;
  RichTextPointWidget({
    required this.score,
    this.fontSize = 14,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return _buildPointSpans(score);
  }

  Widget _buildPointSpans(double score) {
    String scoreStr = DataConverter.scoreToString(score);
    if (scoreStr.contains('.')) {
      final items = scoreStr.split('.');

      return RichText(
        text: TextSpan(
          text: items[0],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: textColor,
          ),
          children: <TextSpan>[
            TextSpan(
              text: ',',
              style: TextStyle(fontSize: 0.45 * fontSize),
            ),
            TextSpan(
              text: items[1],
              style: TextStyle(fontSize: 0.45 * fontSize),
            ),
          ],
        ),
      );
    } else {
      return RichText(
        text: TextSpan(
          text: scoreStr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      );
    }
  }
}

class _MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return _polygonPath(size);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Calculates hexagon corners for given size and center.

Path _polygonPath(Size size) {
  bool inBounds = true;
  double borderRadius = 35;
  final center = Offset(size.width / 2, size.height / 2);

  List<Point> cornerList;
  Point _pointyHexagonCorner(Offset center, double size, int i) {
    var angleDeg = 60 * i - 30;
    var angleRad = pi / 180 * angleDeg;
    return Point(
        center.dx + size * cos(angleRad), center.dy + size * sin(angleRad));
  }

  List<Point> _pointyHexagonCornerList(Offset center, double size) =>
      List<Point>.generate(
        6,
        (index) => _pointyHexagonCorner(center, size, index),
        growable: false,
      );

  cornerList = _pointyHexagonCornerList(
      center, size.height / (inBounds == false ? 0.75 : 1) / 2);

  Point _pointBetween(Point start, Point end,
      {double? distance, double? fraction}) {
    double xLength = (end.x - start.x) as double;
    double yLength = (end.y - start.y) as double;
    if (fraction == null) {
      if (distance == null) {
        throw Exception('Distance or fraction should be specified.');
      }
      double length = sqrt(xLength * xLength + yLength * yLength);
      fraction = distance / length;
    }
    return Point(start.x + xLength * fraction, start.y + yLength * fraction);
  }

  Point _radiusStart(
      Point corner, int index, List<Point> cornerList, double radius) {
    Point prevCorner =
        index > 0 ? cornerList[index - 1] : cornerList[cornerList.length - 1];
    double distance = radius * tan(pi / 6);
    return _pointBetween(corner, prevCorner, distance: distance);
  }

  Point _radiusEnd(
      Point corner, int index, List<Point> cornerList, double radius) {
    Point nextCorner =
        index < cornerList.length - 1 ? cornerList[index + 1] : cornerList[0];
    double distance = radius * tan(pi / 6);
    return _pointBetween(corner, nextCorner, distance: distance);
  }

  final path = Path();
  if (borderRadius > 0) {
    Point rStart;
    Point rEnd;
    cornerList.asMap().forEach((index, point) {
      rStart = _radiusStart(point, index, cornerList, borderRadius);
      rEnd = _radiusEnd(point, index, cornerList, borderRadius);
      if (index == 0) {
        path.moveTo(rStart.x as double, rStart.y as double);
      } else {
        path.lineTo(rStart.x as double, rStart.y as double);
      }
      // rough approximation of an circular arc for 120 deg angle.
      Point control1 = _pointBetween(rStart, point, fraction: 0.7698);
      Point control2 = _pointBetween(rEnd, point, fraction: 0.7698);
      path.cubicTo(
        control1.x.toDouble(),
        control1.y.toDouble(),
        control2.x.toDouble(),
        control2.y.toDouble(),
        rEnd.x.toDouble(),
        rEnd.y.toDouble(),
      );
    });
  } else {
    cornerList.asMap().forEach((index, point) {
      if (index == 0) {
        path.moveTo(point.x.toDouble(), point.y.toDouble());
      } else {
        path.lineTo(point.x.toDouble(), point.y.toDouble());
      }
    });
  }

  return path..close();
}

class _PolygonClipPainter extends CustomPainter {
  final Color backgroundColor;

  _PolygonClipPainter({
    required this.backgroundColor,
  });
  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = backgroundColor.withOpacity(.7);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    paint.maskFilter =
        MaskFilter.blur(BlurStyle.solid, convertRadiusToSigma(3));

    var paintBg = Paint();
    paintBg.color = Colors.white;
    paintBg.style = PaintingStyle.fill;
    final path = _polygonPath(size);
    canvas.drawPath(path, paintBg);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
