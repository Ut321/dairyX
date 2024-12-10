import 'package:flutter/material.dart';

class orDividerWidget extends StatelessWidget {
  const orDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Or'),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}
