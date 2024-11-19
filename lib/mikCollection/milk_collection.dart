import 'package:dairyx/feature/addFarmers/add_farmer.dart';
import 'package:flutter/material.dart';

class MilkCollectionPage extends StatefulWidget {
  @override
  _MilkCollectionPageState createState() => _MilkCollectionPageState();
}

class _MilkCollectionPageState extends State<MilkCollectionPage> {
  String selectedAnimal = 'Cow';
  String milkStatus = 'Morning';
  String selectedCustomer = '1025- Kishan Lal';
  double fat = 3.2;
  double snf = 3.8;
  double rate = 88;
  double totalLiters = 54;
  double totalPrice = 4500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Milk Collection'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddFarmerPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Picker
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Date',
                hintText: '4th June, 2024',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () {
                // Show date picker logic
              },
            ),

            SizedBox(height: 16),

            // Select Animal
            Text('Select Animal'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ChoiceChip(
                  label: Text('Cow'),
                  selected: selectedAnimal == 'Cow',
                  onSelected: (isSelected) {
                    setState(() {
                      selectedAnimal = 'Cow';
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Buffalo'),
                  selected: selectedAnimal == 'Buffalo',
                  onSelected: (isSelected) {
                    setState(() {
                      selectedAnimal = 'Buffalo';
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 16),

            // Milk Status
            Text('Milk Status'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ChoiceChip(
                  label: Text('Morning'),
                  selected: milkStatus == 'Morning',
                  onSelected: (isSelected) {
                    setState(() {
                      milkStatus = 'Morning';
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Evening'),
                  selected: milkStatus == 'Evening',
                  onSelected: (isSelected) {
                    setState(() {
                      milkStatus = 'Evening';
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 16),

            // Code Field
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Code',
                hintText: '5265',
              ),
            ),

            SizedBox(height: 16),

            // Select Customer
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Select Customer',
              ),
              value: selectedCustomer,
              items: ['1025- Kishan Lal']
                  .map((customer) => DropdownMenuItem(
                        value: customer,
                        child: Text(customer),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCustomer = value as String;
                });
              },
            ),

            SizedBox(height: 16),

            // FAT, SNF, Rate Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'FAT',
                      hintText: '${fat.toString()} g',
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'SNF',
                      hintText: '${snf.toString()}',
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Rate',
                      hintText: '₹ ${rate.toString()} /-',
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Total Purchase Ltr and Total Price
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Total Purchase Ltr',
                hintText: '${totalLiters.toString()} Ltr',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Total Price',
                hintText: '₹ ${totalPrice.toString()}',
              ),
            ),

            SizedBox(height: 24),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Submit action
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
