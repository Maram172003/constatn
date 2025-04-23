import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';

class CustomPainterWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pinkPaint = Paint()..color = primaryColor;
    final bluePaint = Paint()..color = primaryColor.shade200;

    // Top pink shape
    final pinkPath = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.2, size.width * 0.7,
          size.height * 0.05)
      ..quadraticBezierTo(size.width * 0.9, 0, size.width, size.height * 0.15)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(pinkPath, pinkPaint);

    // Bottom blue shape
    final bluePath = Path()
      ..moveTo(size.width, size.height)
      ..quadraticBezierTo(size.width * 0.8, size.height * 0.85,
          size.width * 0.5, size.height * 0.9)
      ..quadraticBezierTo(
          size.width * 0.2, size.height * 0.95, 0, size.height * 0.75)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(bluePath, bluePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
