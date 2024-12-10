import 'package:dairyx/feature/registerPage/login_page.dart';
import 'package:dairyx/models/onboarding/onboarding_content_model.dart';
import 'package:dairyx/utils/app_Texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;
  var isFading = false.obs;

  final List<OnboardingContent> contents = [
    OnboardingContent(
      title: Apptexts.onboarding1TextTitle,
      description: Apptexts.onboarding1SubTextTitle,
      image: 'assets/png/onboarding1.png',
    ),
    OnboardingContent(
      title: Apptexts.onboarding2TextTitle,
      description: Apptexts.onboarding2SubTextTitle,
      image: 'assets/png/onboarding2.png',
    ),
    OnboardingContent(
      title: Apptexts.onboarding3TextTitle,
      description: Apptexts.onboarding3SubTextTitle,
      image: 'assets/png/onboarding3.png',
    ),
    OnboardingContent(
      title: Apptexts.onboarding4TextTitle,
      description: Apptexts.onboarding4SubTextTitle,
      image: 'assets/png/onboarding4.png',
    ),
  ];

  void nextPage() {
    if (currentPage.value == contents.length - 1) {
      Get.off(() => LoginPage());
    } else {
      isFading.value = true;
    }
  }

  void handleAnimationEnd() {
    if (isFading.value) {
      isFading.value = false;
      pageController.nextPage(
        duration: const Duration(milliseconds: 100),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}