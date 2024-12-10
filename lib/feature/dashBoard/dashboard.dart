import 'package:dairyx/feature/dashBoard/widgets/dashboard_Container_Widget.dart';
import 'package:dairyx/feature/dashBoard/widgets/dashboard_header.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const dashboardHeader(),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  "Let's get started. ",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: const Color(0xff50555C),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Tell us what you’d like to do today.",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dashboardContainerWidget(
                      title: "Farmers",
                      subtitle: "Track Farmer",
                      subtitle1: "Deliveries",
                      image: "assets/png/manage_farmers.png",
                      milkCategory: "Collect Milk",
                      color1: const Color(0xff2ECC71).withOpacity(1),
                      color2: const Color(0xff176639).withOpacity(1),
                      onPressed: () {},
                    ),
                    // SizedBox(width: 10,),
                    dashboardContainerWidget(
                      title: "Buyers",
                      subtitle: "Track Milk",
                      subtitle1: "Buyers",
                      isFarmer: false,
                      image: "assets/png/manage_buyers.png",
                      milkCategory: "sell Milk",
                      color1: const Color(0xffff6903).withOpacity(1),
                      color2: const Color(0xfffc7e0c).withOpacity(1),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

