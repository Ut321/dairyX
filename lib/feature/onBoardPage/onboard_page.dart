import 'package:flutter/material.dart';
import 'dart:math' show pi, cos, sin;

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingContent> _contents = [
    OnboardingContent(
      title: 'Welcome to the Dairy App!',
      description:
          'Your one-stop solution for managing all aspects of your dairy business.',
      image: 'assets/png/onboarding1.png',
    ),
    OnboardingContent(
      title: 'Track your daily milk production.',
      description: 'Monitor your milk yield and quality over time.',
      image: 'assets/png/onboarding2.png',
    ),
    OnboardingContent(
      title: 'Manage your dairy expenses.',
      description: 'Keep track of your costs and generate detailed reports.',
      image: 'assets/png/onboarding3.png',
    ),
    OnboardingContent(
      title: 'Get insights into your dairy business.',
      description: 'Use our analytics tools to identify areas for improvement',
      image: 'assets/png/onboarding4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _contents.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    content: _contents[index],
                    pageIndex: index,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 48), // Placeholder for spacing
                  CustomProgressButton(
                    progress: (_currentPage + 1) / _contents.length,
                    onPressed: () {
                      if (_currentPage == _contents.length - 1) {
                        // Navigate to home screen
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    isLastPage: _currentPage == _contents.length - 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
            // Progress circle
            CustomPaint(
              painter: CircularProgressPainter(
                progress: progress,
                color: const Color(0xFF2ECC71),
              ),
              size: const Size(60, 60),
            ),
            // Center icon
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF2ECC71),
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

    // Draw progress arc
    final Paint progressPaint = Paint()
      ..color = color
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Background circle
    canvas.drawCircle(
      center,
      radius - progressPaint.strokeWidth / 2,
      Paint()
        ..color = color.withOpacity(0.2)
        ..strokeWidth = progressPaint.strokeWidth
        ..style = PaintingStyle.stroke,
    );

    // Progress arc
    canvas.drawArc(
      Rect.fromCircle(
          center: center, radius: radius - progressPaint.strokeWidth / 2),
      -pi / 2, // Start from top
      2 * pi * progress,
      false,
      progressPaint,
    );

    // Small circle at the end of the progress
    if (progress > 0 && progress < 1) {
      final angle = -pi / 2 + (2 * pi * progress);
      final dotCenter = Offset(
        center.dx + (radius - progressPaint.strokeWidth / 2) * cos(angle),
        center.dy + (radius - progressPaint.strokeWidth / 2) * sin(angle),
      );

      canvas.drawCircle(
        dotCenter,
        progressPaint.strokeWidth / 1.5,
        Paint()..color = color,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}

// Rest of the classes remain the same (OnboardingContent, OnboardingPage, CurvedBackgroundPainter)
class OnboardingContent {
  final String title;
  final String description;
  final String image;

  OnboardingContent({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingContent content;
  final int pageIndex;

  const OnboardingPage(
      {Key? key, required this.content, required this.pageIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Curved green background
        Positioned.fill(
          child: CustomPaint(
            painter: CurvedBackgroundPainter(pageIndex: pageIndex),
          ),
        ),
        // Content
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),
              // Image
              Image.asset(
                content.image,
                height: 280,
              ),
              const Spacer(),
              // Title
              Text(
                content.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Description
              Text(
                content.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}

class CurvedBackgroundPainter extends CustomPainter {
  final int pageIndex;
  final Color color;

  CurvedBackgroundPainter({
    required this.pageIndex,
    this.color = const Color(0xFF2ECC71),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Start from top-left
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);

    // Different curve patterns based on page index
    switch (pageIndex) {
      case 0:
        // Wave-like curve
        path.lineTo(size.width, size.height * 0.5);
        path.quadraticBezierTo(
          size.width * 0.75,
          size.height * 0.7,
          size.width * 0.5,
          size.height * 0.5,
        );
        path.quadraticBezierTo(
          size.width * 0.25,
          size.height * 0.3,
          0,
          size.height * 0.5,
        );
        break;

      case 1:
        // S-shaped curve
        path.lineTo(size.width, size.height * 0.3);
        path.quadraticBezierTo(
          size.width * 0.75,
          size.height * 0.6,
          size.width * 0.5,
          size.height * 0.4,
        );
        path.quadraticBezierTo(
          size.width * 0.25,
          size.height * 0.2,
          0,
          size.height * 0.45,
        );
        break;

      case 2:
        // Diagonal curve
        path.lineTo(size.width, size.height * 0.4);
        path.cubicTo(
          size.width * 0.75,
          size.height * 0.6,
          size.width * 0.5,
          size.height * 0.3,
          0,
          size.height * 0.55,
        );
        break;

      case 3:
        // Double curve
        path.lineTo(size.width, size.height * 0.45);
        path.quadraticBezierTo(
          size.width * 0.8,
          size.height * 0.6,
          size.width * 0.6,
          size.height * 0.45,
        );
        path.quadraticBezierTo(
          size.width * 0.4,
          size.height * 0.3,
          size.width * 0.2,
          size.height * 0.45,
        );
        path.quadraticBezierTo(
          size.width * 0.1,
          size.height * 0.52,
          0,
          size.height * 0.4,
        );
        break;

      default:
        // Default curve
        path.lineTo(size.width, size.height * 0.5);
        path.quadraticBezierTo(
          size.width * 0.5,
          size.height * 0.7,
          0,
          size.height * 0.5,
        );
    }

    // Close the path
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CurvedBackgroundPainter oldDelegate) {
    return oldDelegate.pageIndex != pageIndex || oldDelegate.color != color;
  }
}
