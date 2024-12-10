

double getResponsiveFontSize(double screenWidth, double fontSize) {
  // Adjust this factor based on your design needs
  double baseWidth = 375.0; // Base width for design (e.g., iPhone 11 width)
  return fontSize * (screenWidth / baseWidth);
}