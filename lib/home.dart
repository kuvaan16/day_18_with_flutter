import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'editprofile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 45),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    
                  },
                  child: Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.dark_mode_outlined,
                  color: Colors.grey[700],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Stack(
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("images/OIP.jpeg"),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 8,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 247, 160, 160),
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      LineAwesomeIcons.alternate_pencil,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Your name..",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              user.email!,
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EditProfile(),
                  ),
                );
              },
              child: Container(
                width: 210,
                height: 45,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 247, 160, 160),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Color.fromARGB(42, 247, 160, 160),
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  Ionicons.settings_outline,
                  color: Color.fromARGB(255, 247, 160, 160),
                ),
              ),
              title: Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Icon(
                    Ionicons.chevron_forward,
                    color: Colors.grey[500],
                    size: 19,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Color.fromARGB(42, 247, 160, 160),
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  Ionicons.wallet_outline,
                  color: Color.fromARGB(255, 247, 160, 160),
                ),
              ),
              title: Text(
                "Billing  Detolis",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Icon(
                    Ionicons.chevron_forward,
                    color: Colors.grey[500],
                    size: 19,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Color.fromARGB(42, 247, 160, 160),
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  LineAwesomeIcons.user_check,
                  color: Color.fromARGB(255, 247, 160, 160),
                ),
              ),
              title: Text(
                "User Management",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Icon(
                    Ionicons.chevron_forward,
                    color: Colors.grey[500],
                    size: 19,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Color.fromARGB(42, 247, 160, 160),
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  LineAwesomeIcons.info,
                  color: Color.fromARGB(255, 247, 160, 160),
                ),
              ),
              title: Text(
                "Information",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Icon(
                    Ionicons.chevron_forward,
                    color: Colors.grey[500],
                    size: 19,
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              padding: EdgeInsets.all(0),
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(42, 247, 160, 160),
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    LineAwesomeIcons.alternate_sign_out,
                    color: Color.fromARGB(255, 247, 160, 160),
                  ),
                ),
                title: Text(
                  "Logout",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, color: Colors.red),
                ),
                trailing: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Icon(
                      Ionicons.chevron_forward,
                      color: Colors.grey[500],
                      size: 19,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
