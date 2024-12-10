import 'package:dairyx/common/circularProgress_painter.dart';
import 'package:flutter/material.dart';

class CustomProgressButton extends StatelessWidget {
  final double progress;
  final VoidCallback onPressed;
  final bool isLastPage;

  const CustomProgressButton({
    Key? key,
    required this.progress,
    required this.onPressed,
    required this.isLastPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              painter: CircularProgressPainter(
                progress: progress,
                color: const Color(0xFF2ECC71),
              ),
              size: const Size(60, 60),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xff2ECC71).withOpacity(1),
                    const Color(0xff176639).withOpacity(1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Icon(
                isLastPage ? Icons.check : Icons.arrow_forward,
                color: Colors.white,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
