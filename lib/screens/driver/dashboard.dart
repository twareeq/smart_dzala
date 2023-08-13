import 'package:flutter/material.dart';

class Bin {
  final String name;
  final String status;

  Bin({required this.name, required this.status});
}

class Driver {
  final String name;
  final List<String> assignedBins;

  Driver({required this.name, required this.assignedBins});
}

class AdminModule extends StatefulWidget {
  const AdminModule({Key? key}) : super(key: key);

  @override
  _AdminModuleState createState() => _AdminModuleState();
}

class _AdminModuleState extends State<AdminModule> {
  List<Bin> bins = [
    Bin(name: 'Bin 1', status: 'Full'),
    Bin(name: 'Bin 2', status: 'Empty'),
    Bin(name: 'Bin 3', status: 'Full'),
    Bin(name: 'Bin 4', status: 'Empty'),
  ];

  List<Driver> drivers = [
    Driver(name: 'John Doe', assignedBins: ['Bin 1', 'Bin 3']),
    Driver(name: 'Jane Smith', assignedBins: ['Bin 2', 'Bin 4']),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Module'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Bins',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: bins.length,
              itemBuilder: (context, index) {
                final bin = bins[index];
                return Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(bin.name),
                    subtitle: Text('Status: ${bin.status}'),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Drivers',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: drivers.length,
              itemBuilder: (context, index) {
                final driver = drivers[index];
                return Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(driver.name),
                    subtitle: Text('Assigned Bins: ${driver.assignedBins.join(', ')}'),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  _addBin();
                },
                child: Text('Add Bin'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  _addDriver();
                },
                child: Text('Add Driver'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  _assignWork();
                },
                child: Text('Assign Work'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  _viewWorkHistory();
                },
                child: Text('View Work History'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addBin() {
    // Add bin logic
    setState(() {
      bins.add(
        Bin(name: 'New Bin', status: 'Empty'),
      );
    });
  }

  void _addDriver() {
    // Add driver logic
    setState(() {
      drivers.add(
        Driver(name: 'New Driver', assignedBins: []),
      );
    });
  }

  void _assignWork() {
    // Assign work logic
    // Code to assign bins to drivers
  }

  void _viewWorkHistory() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Work History'),
          content: SingleChildScrollView(
            child: Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(120),
                1: FixedColumnWidth(120),
                2: FixedColumnWidth(120),
              },
              children: [
                TableRow(
                  children: [
                    TableCell(child: Text('New Bins')),
                    TableCell(child: Text('Full Bins')),
                    TableCell(child: Text('Empty Bins')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('3')),
                    TableCell(child: Text('2')),
                    TableCell(child: Text('4')),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

}
