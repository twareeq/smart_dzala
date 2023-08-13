import 'package:flutter/material.dart';

class ViewHistoryPage extends StatelessWidget {
  final List<String> historyList;

  const ViewHistoryPage({required this.historyList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View History'),
      ),
      body: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(historyList[index]),
            leading: Icon(Icons.history),
          );
        },
      ),
    );
  }
}
