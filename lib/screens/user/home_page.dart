import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:smart_dzala/components/doughnutchart.dart';
import 'package:smart_dzala/screens/driver/dashboard.dart';
import 'package:smart_dzala/screens/navigation_page.dart';
import 'package:smart_dzala/screens/user/Aboutus_page.dart';
import 'package:smart_dzala/screens/user/login_page.dart';
import 'package:smart_dzala/screens/user/maps.dart';
import 'package:smart_dzala/screens/user/others_page.dart';
import 'package:smart_dzala/screens/user/tasks_page.dart';


import '../../services/geolocator.dart';
import '../admin/admin_page.dart';
import 'gridControl.dart';
import 'myprofile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? _user = FirebaseAuth.instance.currentUser;
  bool isGasDetectionEnabled = false;
  List<FlSpot> gasLevelData = [];

  @override
  void initState() {
    super.initState();

    retrieveGasLevelData();
    determinePosition();
  }

  // Retrieve gas level data from Firebase
  void retrieveGasLevelData() {
    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child('gas-levels').onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      Map<dynamic, dynamic>? data = snapshot.value as Map?;
      gasLevelData.clear();
      data!.forEach((key, value) {
        gasLevelData.add(FlSpot(double.parse(key), value));
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SMARTdZala", style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.person))],
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.indigo),
                accountName: Text(
                  "Sithe Moyo",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  "sithewed@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/siphe.jpg'),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_circle,
                ),
                title: const Text('My profile'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProfile()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.people_alt,
                ),
                title: const Text('About us'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AboutUsPage()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout_outlined,
                ),
                title: const Text('Log out'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavigationPage()));
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // border: Border.all(
                    //   // color: Colors.indigo,
                    //   width: 1,
                    // ),
                    image: const DecorationImage(
                        image: AssetImage('images/three.png'),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // gradient:
                      //     LinearGradient(begin: Alignment.bottomRight, colors: [
                      //   Colors.black.withOpacity(.4),
                      //   Colors.black.withOpacity(.2),
                      // ]),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      // const Text(
                      //   "Garbage Management",
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 35,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                      // Container(
                      //   height: 50,
                      //   margin: const EdgeInsets.symmetric(horizontal: 40),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       color: Colors.white),
                      //   child: Center(
                      //       child: Text(
                      //     "Our Services",
                      //     style: TextStyle(
                      //         color: Colors.grey[900],
                      //         fontWeight: FontWeight.bold),
                      //   )),
                      // ),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
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
                                  pageBuilder: (_, __, ___) => MyGoogleMap(),
                                  transitionsBuilder: (_, animation, __, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },

                            child: myCard(imageName: 'map', title: 'Maps', desc: '', ext:'png')),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 500),
                                pageBuilder: (_, __, ___) => BinCard(),
                                transitionsBuilder: (_, animation, __, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },

                          child: myCard(imageName: 'device', title: 'Device', desc: '', ext: 'png',),),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration(milliseconds: 500),
                                  pageBuilder: (_, __, ___) => MyTasks(),
                                  transitionsBuilder: (_, animation, __, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },

                            child: myCard(imageName: 'tasks', title: 'Tasks', desc: '',ext: 'png')),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration(milliseconds: 500),
                                  pageBuilder: (_, __, ___) => MyOthers(),
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
                  ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
