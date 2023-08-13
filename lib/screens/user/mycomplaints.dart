import 'package:flutter/material.dart';

class ComplaintsPage extends StatelessWidget {
  final List<String> complaints;

  const ComplaintsPage({Key? key, required this.complaints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sent complaints'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: complaints.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(complaints[index]),
            );
          },
        ),
      ),
    );
  }
}