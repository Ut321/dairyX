import 'dart:math';
import 'package:flutter/material.dart';

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color color;

  CircularProgressPainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Background circle
    final Paint backgroundPaint = Paint()
      ..color = color.withOpacity(0.2)
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      center,
      radius - backgroundPaint.strokeWidth / 2,
      backgroundPaint,
    );

    // Gradient for the progress arc
    final gradient = LinearGradient(
      colors: [
        const Color(0xff2ECC71).withOpacity(1),
        const Color(0xff176639).withOpacity(1),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final Rect rect = Rect.fromCircle(center: center, radius: radius);
    final Shader shader = gradient.createShader(rect);

    final Paint progressPaint = Paint()
      ..shader = shader
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw progress arc
    canvas.drawArc(
      Rect.fromCircle(
          center: center, radius: radius - progressPaint.strokeWidth / 2),
      -pi / 2,
      2 * pi * progress,
      false,
      progressPaint,
    );

    // Progress dot
    if (progress > 0 && progress < 1) {
      final angle = -pi / 2 + (2 * pi * progress);
      final dotCenter = Offset(
        center.dx + (radius - progressPaint.strokeWidth / 2) * cos(angle),
        center.dy + (radius - progressPaint.strokeWidth / 2) * sin(angle),
      );

      canvas.drawCircle(
        dotCenter,
        progressPaint.strokeWidth / 1.5,
        Paint()..shader = shader,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
