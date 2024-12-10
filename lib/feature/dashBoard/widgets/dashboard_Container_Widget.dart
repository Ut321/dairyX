import 'package:flutter/material.dart';

class dashboardContainerWidget extends StatelessWidget {
  dashboardContainerWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.subtitle1,
    required this.image,
    required this.milkCategory,
    required this.onPressed,
    required this.color1,
    required this.color2,
    bool this.isFarmer = true
  });
  final String title;
  final String subtitle;
  final String subtitle1;
  final String image;
  final String milkCategory;
  final VoidCallback onPressed;
  final Color color1, color2;
  final bool isFarmer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              gradient: LinearGradient(
                begin: isFarmer ? Alignment.centerLeft : Alignment.topCenter,
                end: isFarmer ? Alignment.centerRight : Alignment.bottomCenter,
                colors: [
                  color1,
                  color2
                  // const Color(0xff2ECC71).withOpacity(1),
                  // const Color(0xff176639).withOpacity(1)
                ],
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Manage",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                Text(
                  subtitle1,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  image,
                  height: 150,
                  width: 150,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          milkCategory,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
                begin: isFarmer ? Alignment.centerLeft : Alignment.topCenter,
                end: isFarmer ? Alignment.centerRight : Alignment.bottomCenter,
              colors: [
                color1,
                color2
              ],
            ),
          ),
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
