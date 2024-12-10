import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CurvedBackgroundPainter extends CustomPainter {
  final int pageIndex;
  final Color color;

  CurvedBackgroundPainter({
    required this.pageIndex,
    this.color = const Color(0xFF2ECC71),
  });

  @override
  void paint(Canvas canvas, Size size) {
  

    final path = Path();

    path.lineTo(0, 0);
    path.lineTo(size.width, 0);

    switch (pageIndex) {
      case 0:
        path.lineTo(size.width, size.height * 0.4);
        path.quadraticBezierTo(
          size.width * 0.6,
          size.height * 0.8,
          0,
          size.height * 0.5,
        );
        break;

      case 1:
        path.lineTo(size.width, size.height * 0.3);
        path.quadraticBezierTo(
          size.width * 0.75,
          size.height * 0.55,
          size.width * 0.5,
          size.height * 0.4,
        );
        path.quadraticBezierTo(
          size.width * 0.3,
          size.height * 0.1,
          0,
          size.height * 0.4,
        );
        break;

      case 2:
        path.moveTo(0, size.height * 0.3);
        path.cubicTo(0, size.height * 0.3, size.width * 0.06, size.height * 0.3,
            size.width * 0.090, size.height * 0.35);
        path.cubicTo(71.0544, 358.344, 137.078, 418, 223.189, 418);

        // path.cubicTo(size.width * 0.18,  size.height * 0.6,size.width * 0.35, size.height * 0.5, size.width * 0.57, size.height * 0.5);

        //path.cubicTo(size.width * 0.7, size.height * 0.5, size.width, size.height * 0.4, size.width,size.height * 0.4);
        path.cubicTo(309.3, 418, 393, 305.604, size.width, 234.508);

        path.lineTo(size.width, 0);
        path.lineTo(0, 0);
        path.close();

        break;

      case 3:
        path.moveTo(
            0, size.height * 0.35); // Start the path at a relative height
        path.cubicTo(
          0,
          size.height * 0.35, // Starting point height
          size.width * 0.06, // Increased control point X1 for a wider curve
          size.height * 0.2, // Adjusted control point Y1 for depth
          size.width * 0.2, // Adjusted endpoint X1 for width
          size.height * 0.3, // Adjusted endpoint Y1 for smooth transition
        );
        path.cubicTo(
          size.width * 0.22, // Control point X2 for a deeper curve
          size.height * 0.3, // Control point Y2
          size.width * 0.4, // Control point X3
          size.height * 0.5, // Control point Y3
          size.width * 0.8, // Endpoint X2
          size.height * 0.55, // Adjusted bottom-right height for smoothness
        );
        path.cubicTo(
          size.width * 0.9, // Control point X4
          size.height * 0.55, // Adjusted height for smoothness
          size.width, // Endpoint X3 (full width)
          size.height * 0.5, // Lowered bottom-right corner
          size.width, // Top-right corner
          size.height * 0.46, // Lowered height for smoother transition
        );
        path.lineTo(size.width, 0); // Top-right corner of the canvas
        path.lineTo(0, 0); // Top-left corner of the canvas
        path.close();
        break;

      default:
        path.lineTo(size.width, size.height * 0.5);
        path.quadraticBezierTo(
          size.width * 0.5,
          size.height * 0.7,
          0,
          size.height * 0.5,
        );
    }

    path.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(0, size.height * 0.4421303),
        Offset(size.width, size.height * 0.4421303),
        [Color(0xff2ECC71).withOpacity(1), Color(0xff176639).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CurvedBackgroundPainter oldDelegate) {
    return oldDelegate.pageIndex != pageIndex || oldDelegate.color != color;
  }
}
