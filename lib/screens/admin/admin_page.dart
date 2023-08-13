import 'package:flutter/material.dart';
import 'package:smart_dzala/screens/admin/bin_page.dart';
import 'package:smart_dzala/screens/admin/complaint_page.dart';
import 'package:smart_dzala/screens/admin/createbin_page.dart';
import 'package:smart_dzala/screens/admin/createdriver_page.dart';
import 'package:smart_dzala/screens/admin/driver_page.dart';
import 'package:smart_dzala/screens/admin/workhistory_page.dart';
import 'package:smart_dzala/screens/driver/driver.dart';

import '../../components/doughnutchart.dart';
import '../user/gridControl.dart';
import '../user/maps.dart';
import '../user/others_page.dart';
import '../user/tasks_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            primary: false,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (_, __, ___) => BinPage(),
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },

                  child: myCard(imageName: 'map', title: 'Bin', desc: '', ext:'png')),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (_, __, ___) => DiverrPage(),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },

                child: myCard(imageName: 'device', title: 'Driver', desc: '', ext: 'png',),),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (_, __, ___) => ViewComplaintsPage(),
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },

                  child: myCard(imageName: 'tasks', title: 'complaints', desc: '',ext: 'png')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (_, __, ___) => WorkHistoryPage(),
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: myCard(imageName: 'other', title: 'Others', desc: '',ext: 'png')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (_, __, ___) => DriverPagee(),
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: myCard(imageName: 'other', title: 'User details', desc: '',ext: 'png')),
            ]),
        ),
      ),
    );
  }
}
