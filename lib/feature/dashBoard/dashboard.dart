import 'package:dairyx/feature/addFarmers/add_farmer.dart';
import 'package:dairyx/feature/formerDetails/former_details.dart';
import 'package:dairyx/mikCollection/milk_collection.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          children: [
            CircleAvatar(),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good Morning, 👋',
                    style: TextStyle(color: Colors.black, fontSize: 14)),
                Text('Kishan Lal',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ],
            ),
            Spacer(),
            Icon(Icons.notifications, color: Colors.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSummaryCards(),
            const SizedBox(height: 16),
            _buildQuickActions(),
            const SizedBox(height: 16),
            _buildGraphSection(),
            const SizedBox(height: 16),
            _buildOrdersSection(),
            const SizedBox(height: 16),
            _buildDeliveryHistory(),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSummaryCard(
            '₹ 24,500', 'Total milk scale', 'assets/milk_icon.png'),
        _buildSummaryCard(
            '4500 ltr', 'Total milk collection', 'assets/collection_icon.png'),
        _buildSummaryCard(
            '500 ltr', 'Total milk available', 'assets/available_icon.png'),
      ],
    );
  }

  Widget _buildSummaryCard(String value, String label, String iconPath) {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
          Image.asset(iconPath, height: 24),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    List<Map<String, dynamic>> actions = [
      {
        'label': 'Milk Collection',
        'icon': Icons.local_drink,
        'page': MilkCollectionPage()
      },
      {
        'label': 'Farmers',
        'icon': Icons.people,
        'page': FarmersContactScreen()
      }, // Add other actions here
      {'label': 'Rate Chart', 'icon': Icons.show_chart, 'page': null},
      {'label': 'Payment', 'icon': Icons.payment, 'page': null},
      {'label': 'Reports', 'icon': Icons.report, 'page': null},
      {'label': 'Dues', 'icon': Icons.money_off, 'page': null},
      {'label': 'Ledger', 'icon': Icons.book, 'page': null},
      {'label': 'Orders', 'icon': Icons.shopping_bag, 'page': null},
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: actions.map((action) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                if (action['page'] != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => action['page']),
                  );
                }
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    child: Icon(action['icon'], color: Colors.blue),
                    radius: 28,
                  ),
                  const SizedBox(height: 6),
                  Text(action['label'], style: const TextStyle(fontSize: 12)),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildGraphSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Milk Quality Graph',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        Container(
          height: 150,
          color: Colors.grey.shade200, // Placeholder for graph
          child: const Center(child: Text('Graph Placeholder')),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildGraphInfoCard('Average Milk Quality', '500 ltr'),
            _buildGraphInfoCard('No. of Active Farmers', '2628'),
          ],
        ),
      ],
    );
  }

  Widget _buildGraphInfoCard(String label, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 12)),
            Text(value,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersSection() {
    List<String> orders = ['Milk', 'Ghee', 'Paneer', 'Dahi'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: orders.map((order) {
        return Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.purple.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Text(order)),
        );
      }).toList(),
    );
  }

  Widget _buildDeliveryHistory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Icon(Icons.history, color: Colors.orange),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Delivery History',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('4.5 Ltr | 22 Jan, 7:38 AM',
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text('View more', style: TextStyle(color: Colors.green)),
        ),
      ],
    );
  }
}
