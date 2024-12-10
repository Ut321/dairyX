import 'package:dairyx/feature/onBoardPage/widgets/cureved_background.dart';
import 'package:dairyx/models/onboarding/onboarding_content_model.dart';
import 'package:flutter/material.dart';

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
        Positioned.fill(
          child: CustomPaint(
            painter: CurvedBackgroundPainter(pageIndex: pageIndex),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
             // const SizedBox(height: 20,),
              const Spacer(),
              const Spacer(),
              // Image
              Image.asset(
                content.image,
              
              ),
              const Spacer(),

              Text(
                content.title,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                content.description,
                style: Theme.of(context).textTheme.bodyMedium,
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

