import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
class BinCard extends StatefulWidget {
  const BinCard({Key? key}) : super(key: key);

  @override
  State<BinCard> createState() => _BinCardState();
}

class _BinCardState extends State<BinCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device'),
      ),
      body: Center(
        child: CircularPercentIndicator(
          radius: 120.0,
          lineWidth: 13.0,
          animation: true,
          percent: 0.7,
          center: const Text(
            "70.0%",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          footer: const Text(
            "Bin levels ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.purple,
        )
        ,
      ),
    );
  }
}
