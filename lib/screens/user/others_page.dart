import 'package:flutter/material.dart';
import 'package:smart_dzala/screens/user/mycomplaints.dart';
import 'package:smart_dzala/screens/user/myprofile.dart';
import 'package:smart_dzala/screens/user/pickups_page.dart';
import 'package:smart_dzala/screens/user/registercomplaints.dart';
class MyOthers extends StatefulWidget {
  const MyOthers({Key? key}) : super(key: key);

  @override
  State<MyOthers> createState() => _MyOthersState();
}

class _MyOthersState extends State<MyOthers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Others'),
      ),
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
                          pageBuilder: (_, __, ___) => const MyRegister(),
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
                    title: const Text('Register complaints'),
                    //textColor: Colors.white,
                    trailing: const Icon(Icons.navigate_next),
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       border: Border.all(
              //         color: Colors.grey,
              //         width: 1,
              //       )
              //   ),
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         PageRouteBuilder(
              //           transitionDuration: const Duration(milliseconds: 500),
              //           pageBuilder: (_, __, ___) => const ComplaintsPage(complaints: [],),
              //           transitionsBuilder: (_, animation, __, child) {
              //             return FadeTransition(
              //               opacity: animation,
              //               child: child,
              //             );
              //           },
              //         ),
              //       );
              //     },
              //     child: ListTile(
              //       leading: Image.asset('images/viewcom.png'),
              //       title: const Text('My complaints'),
              //       //textColor: Colors.white,
              //       trailing: const Icon(Icons.navigate_next),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 8,),
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
                        pageBuilder: (_, __, ___) => const MyProfile(),
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
                    title: const Text('My Profile'),
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
