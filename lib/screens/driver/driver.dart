import 'package:flutter/material.dart';
import 'package:smart_dzala/screens/driver/viewhistory_page.dart';

class DriverPagee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<String> myList = [
      'ROUTE 1: completed',
      'ROUTE 2: not emptied',
      'ROUTE 3: completed',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Sithe Moyo'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email: sithewed@gmail.com'),
                Text('Phone Number: +265888320672'),
                Text('Address: Area 3, lilongwe, Malawi'),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Assigned Work'),
            subtitle: Text('Route 1'),
            trailing: ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: Text('View Details'),
            ),
          ),
          SizedBox(height: 16.0),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Work History'),
            subtitle: Text('Total completed: 20'),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewHistoryPage(historyList: myList),));// Handle button press
              },
              child: Text('View History'),
            ),
          ),
        ],
      ),
    );
  }
}
