import 'dart:io';

import 'package:day_17_with_flutter/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:day_17_with_flutter/resources/add_data.dart';
import 'dart:ui' as ui;

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getEmailFromFirebase();
  }

  void getEmailFromFirebase() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    String? email = currentUser?.email;
    _emailController.text = email ?? '';
  }

  Uint8List? _image;
  Future selectImage() async {
    try {
      Uint8List img = await pickImage(ImageSource.gallery);
      setState(() {
        _image = img;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  void saveProfile() async {
    String resp = await StoreData().saveData(
      name: _fullnameController.text,
      phoneNo: _phoneController.text,
      file: _image!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15, top: 45),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
                    child: _image != null
                        ? CircleAvatar(
                            radius: 60,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage("images/OIP.jpeg"),
                          ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 8,
                    child: InkWell(
                      onTap: () => selectImage(),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 247, 160, 160),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          LineAwesomeIcons.camera,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: TextField(
                  controller: _fullnameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: 'Fullname',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        LineAwesomeIcons.user,
                        color: Colors.black,
                      )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    labelText: 'Phone No',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                    prefixIcon: Icon(
                      LineAwesomeIcons.phone,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  saveProfile();
                },
                child: Container(
                  width: 290,
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
                height: 160,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Joined "),
                        Text(
                          "26 March 2023",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(29, 244, 67, 54),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Delete",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
