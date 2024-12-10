import 'package:dairyx/feature/dashBoard/dashboard.dart';
import 'package:flutter/material.dart';

enum UserType { farmer, buyer, none }

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  UserType selectedType = UserType.none;
  bool showPopup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 1 / 4,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFA5D6A7),
                      Color(0xFFF1F8F6),
                      Colors.white,
                    ],
                    stops: [0.0, 0.7, 1.0],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Welcome, Shivam!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Let's get started.",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Tell us what you'd like to do today.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedType = UserType.farmer;
                              showPopup = true;
                            });
                            Future.delayed(const Duration(milliseconds: 1500), () {
                              setState(() {
                                showPopup = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  DashboardPage(),
                                ),
                              );
                            });
                          },
                          child: _buildCard(
                            title: 'Manage\nFarmers',
                            subtitle: 'Track Farmer\nDeliveries',
                            buttonText: 'Collect Milk',
                            color: Colors.green,
                            icon: '🐄',
                            isSelected: selectedType == UserType.farmer,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedType = UserType.buyer;
                              showPopup = true;
                            });
                            Future.delayed(const Duration(milliseconds: 1500), () {
                              setState(() {
                                showPopup = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  DashboardPage(),
                                ),
                              );
                            });
                          },
                          child: _buildCard(
                            title: 'Manage\nBuyers',
                            subtitle: 'Track Milk\nBuyers',
                            buttonText: 'Sell Milk',
                            color: Colors.deepOrange,
                            icon: '🥛',
                            isSelected: selectedType == UserType.buyer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (showPopup)
              Center(
                child: AnimatedScale(
                  scale: showPopup ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          selectedType == UserType.farmer
                              ? Icons.agriculture
                              : Icons.local_drink,
                          size: 80,
                          color: selectedType == UserType.farmer
                              ? Colors.green.shade700
                              : Colors.deepOrange.shade700,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          selectedType == UserType.farmer
                              ? 'Managing Farmers'
                              : 'Managing Buyers',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: selectedType == UserType.farmer
                                ? Colors.green
                                : Colors.deepOrange,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Please wait while we navigate you to the dashboard.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required String buttonText,
    required Color color,
    required String icon,
    required bool isSelected,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? color.withOpacity(0.3) : color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
          width: 2,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: color.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: color.withOpacity(0.8),
              height: 1.2,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            icon,
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  buttonText,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward,
                  color: color,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
