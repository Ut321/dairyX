import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class socialMediaWidget extends StatelessWidget {
  const socialMediaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.google,
              color: Colors.red),
          onPressed: () {
            // Handle Google sign-in
          },
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.facebook,
              color: Colors.blue),
          onPressed: () {
            // Handle Facebook sign-in
          },
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.apple,
              color: Colors.black),
          onPressed: () {
            // Handle Apple sign-in
          },
        ),
      ],
    );
  }
}

