import 'package:dairyx/common/circular_progress_button.dart';
import 'package:dairyx/controllers/onboard/onboard_controller.dart';
import 'package:dairyx/feature/onBoardPage/widgets/onboarding_page_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: controller.isFading.value ? 0.0 : 1.0,
                onEnd: controller.handleAnimationEnd,
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.contents.length,
                  onPageChanged: (index) {
                    controller.currentPage.value = index;
                  },
                  itemBuilder: (context, index) {
                    return OnboardingPage(
                      content: controller.contents[index],
                      pageIndex: index,
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 48),
                Obx(
                  () => CustomProgressButton(
                    progress: (controller.currentPage.value + 1) /
                        controller.contents.length,
                    onPressed: controller.nextPage,
                    isLastPage:
                        controller.currentPage.value ==
                        controller.contents.length - 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}