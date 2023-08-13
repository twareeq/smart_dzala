import 'package:flutter/material.dart';
import 'package:smart_dzala/screens/admin/admin_page.dart';
import 'package:smart_dzala/screens/driver/dashboard.dart';
import 'package:smart_dzala/screens/driver/driver.dart';
import 'package:smart_dzala/screens/user/login_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
           const Padding(
             padding:  EdgeInsets.fromLTRB(80, 100, 80, 20),
             child: Image(
              image: AssetImage('images/img.png'),
          ),
           ),
          const Center(
            child: Text(
              'Garbage Management',
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdminModule()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.indigo,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                    child: ClipOval(
                      child: Image.asset("images/mypro.png"),
                    ),
                  ),
                ),
                title: const Center(child: Text('ADMIN')),
                //subtitle: Text('Register Your Complaint here'),
                textColor: Colors.white,
                trailing: const Icon(Icons.navigate_next),
              ),
            ),
          ),

          const SizedBox(height: 1,),

          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginPage()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.indigo,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                    child: ClipOval(
                      child: Image.asset("images/mypro.png"),
                    ),
                  ),
                ),
                title: const Center(child: Text('USER')),
                //subtitle: Text('View Your Complaint here'),
                textColor: Colors.white,
                trailing: const Icon(Icons.navigate_next),
              ),
            ),
          ),
          const SizedBox(height: 15,),

          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DriverPagee()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.indigo,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                    child: ClipOval(
                      child: Image.asset("images/mypro.png"),
                    ),
                  ),
                ),
                title: const Center(child: Text('DRIVER')),
                //subtitle: Text('View Your Complaint here'),
                textColor: Colors.white,
                trailing: const Icon(Icons.navigate_next),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

