import 'package:flutter/material.dart';

class FarmersContactScreen extends StatelessWidget {
  final List<Map<String, String>> farmers = [
    {'name': 'Rajesh Patel', 'phone': '+91 837823429'},
    {'name': 'Suresh Yadav', 'phone': '+91 837823429'},
    {'name': 'Dinesh Kumar', 'phone': '+91 837823429'},
    {'name': 'Ram Lal', 'phone': '+91 837823429'},
    {'name': 'Mohan Singh', 'phone': '+91 837823429'},
    {'name': 'Gopal Sharma', 'phone': '+91 837823429'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Farmers', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Add back navigation logic
          },
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.mic),
                hintText: 'Search...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: farmers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green[100],
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        farmers[index]['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(farmers[index]['phone']!),
                      trailing: IconButton(
                        icon: Icon(Icons.call, color: Colors.green),
                        onPressed: () {
                          // Add call functionality
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green[50],
    );
  }
}