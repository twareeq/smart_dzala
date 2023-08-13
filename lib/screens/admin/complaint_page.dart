import 'package:flutter/material.dart';

class ViewComplaintsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Complaints'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ComplaintCard(
            title: 'Garbage not collected',
            description: 'The garbage bin on 123 Main St has not been collected for a week.',
            status: 'Pending',
          ),
          SizedBox(height: 16.0),
          ComplaintCard(
            title: 'Damaged garbage bin',
            description: 'The garbage bin near the park is damaged and needs repair.',
            status: 'In Progress',
          ),
          SizedBox(height: 16.0),
          ComplaintCard(
            title: 'Overflowing garbage bin',
            description: 'The garbage bin at the shopping center is overflowing with trash.',
            status: 'Resolved',
          ),
        ],
      ),
    );
  }
}

class ComplaintCard extends StatelessWidget {
  final String title;
  final String description;
  final String status;

  const ComplaintCard({
    required this.title,
    required this.description,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: Chip(
          backgroundColor: getStatusColor(),
          label: Text(status),
        ),
      ),
    );
  }

  Color getStatusColor() {
    if (status == 'Pending') {
      return Colors.orange;
    } else if (status == 'In Progress') {
      return Colors.blue;
    } else if (status == 'Resolved') {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }
}
