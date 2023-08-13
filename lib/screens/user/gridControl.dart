import 'package:flutter/material.dart';

class myCard extends StatelessWidget {
  myCard({super.key,required this.imageName, required this.title, required this.desc, required this.ext});

  String imageName;
  String title;
  String desc;
  String ext;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipPath(
        clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Column(
          children: [
            Image.asset('images/$imageName.$ext'),
            Text(title),
            Text(desc),
          ],
        ),
      ),
    );
  }
}
