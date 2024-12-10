import 'package:dairyx/common/app_title_widget.dart';
import 'package:dairyx/feature/onBoardPage/onboard_page.dart';
import 'package:dairyx/utils/app_Texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(flex: 2),
            // Logo and Text Section
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Text
                AppTitleWidget(),
                const SizedBox(height: 8),
                // Tagline
                const Text(
                  Apptexts.appSubTitile,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Spacer(flex: 2),
            // Get Started Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff2ECC71),
                        Color(0xff176639),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => OnboardingScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // Set transparent color
                      shadowColor: Colors.transparent, // Remove shadow
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
