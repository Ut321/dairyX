import 'package:dairyx/utils/font.dart';
import 'package:flutter/material.dart';


TextTheme buildTextTheme(double screenWidth) {
    return TextTheme(
      headlineLarge: TextStyle(fontSize: getResponsiveFontSize(screenWidth, 96)),
      headlineMedium: TextStyle(fontSize: getResponsiveFontSize(screenWidth, 60)),
      headlineSmall: TextStyle(fontSize: getResponsiveFontSize(screenWidth, 48)),
      labelLarge: TextStyle(fontSize: getResponsiveFontSize(screenWidth, 34)),
      labelMedium: TextStyle(fontSize: getResponsiveFontSize(screenWidth, 24)),
      labelSmall: TextStyle(fontSize: getResponsiveFontSize(screenWidth, 20)),
      bodyLarge: TextStyle(fontSize: getResponsiveFontSize(screenWidth, 16)),
      bodyMedium: TextStyle(fontSize: getResponsiveFontSize(screenWidth, 14)),
      bodySmall: TextStyle(fontSize: getResponsiveFontSize(screenWidth, 16)),
      displayLarge: TextStyle(fontSize: getResponsiveFontSize(screenWidth, 14)),
      displayMedium: TextStyle(fontSize: getResponsiveFontSize(screenWidth, 14)),
      displaySmall: TextStyle(fontSize: getResponsiveFontSize(screenWidth, 12)),
      // overline: TextStyle(fontSize: getResponsiveFontSize(screenWidth, 10)),
    );
  }
