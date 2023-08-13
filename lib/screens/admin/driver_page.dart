import 'package:flutter/material.dart';
import 'package:smart_dzala/screens/admin/viewdriver_page.dart';

import 'createdriver_page.dart';

class DiverrPage extends StatefulWidget {
  const DiverrPage({Key? key}) : super(key: key);

  @override
  State<DiverrPage> createState() => _DiverrPageState();
}

class _DiverrPageState extends State<DiverrPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Driver'),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    )
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder: (_, __, ___) => const DriverPage(),
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: ListTile(
                    leading:Image.asset('images/regcom.png'),
                    title: const Text('Create driver'),
                    //textColor: Colors.white,
                    trailing: const Icon(Icons.navigate_next),
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder: (_, __, ___) =>  ViewDriverPage(),
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Image.asset('images/mypro.png'),
                    title: const Text('Update bin'),
                    //textColor: Colors.white,
                    trailing: const Icon(Icons.navigate_next),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
