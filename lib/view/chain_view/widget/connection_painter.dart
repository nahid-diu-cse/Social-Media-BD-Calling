import 'dart:ui';

import 'package:flutter/material.dart';

class ConnectionPainter extends CustomPainter {
  final List<Offset> points;

  ConnectionPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1.5;

    for (int i = 1; i < points.length; i++) {
      canvas.drawLine(points[0], points[i], paint); // draw from center to others
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
