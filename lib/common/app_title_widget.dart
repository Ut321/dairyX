import 'package:dairyx/utils/app_Texts.dart';
import 'package:flutter/material.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
                  text:  TextSpan(
                    children: [
                      TextSpan(
                        text: Apptexts.appTitile,
                        style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold,fontSize: 36)
                      ),
                      TextSpan(
                        text: 'X',
                        style:  Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold,fontSize: 40,color: const Color(0xff1a7340))

                      ),
                    ],
                  ),
                );
  }
}