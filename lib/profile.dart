// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Model/user.dart';
import 'package:myapp/editprofile.dart';
import 'package:myapp/theme/theme.dart';

class profilecsreen extends StatefulWidget {
  const profilecsreen({super.key});

  @override
  State<profilecsreen> createState() => _profilecsreenState();
}

class _profilecsreenState extends State<profilecsreen> {
  UserModel? user;
  static final auth = FirebaseAuth.instance;
  String name = "";
  String age = "";
  String phone = "";
  Future<void> Getuser() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          name=
          snapshot.data()!['username'];
          age=
          snapshot.data()!['age'];
          phone=
          snapshot.data()!['phone'];
        });
        return user;
      } else {
        print("no data");
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => edit_profile()));
              },
              icon: Icon(Icons.edit, color: Appcolor.quaternarycolor))
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Appcolor.primarycolor,
        title: Text('Profile',
            style: TextStyle(
                color: Appcolor.quaternarycolor,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVhml9c3umS8HbHT8dRrbpkWIzn8yX0nWVNYBcIJAn0bj4-DOL39OZR2sVIRRumXjGnTI&usqp=CAU"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                    color: Appcolor.secondarycolor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                phone,
                style: TextStyle(
                  color: Appcolor.secondarycolor,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                color: Color.fromARGB(255, 215, 211, 216),
                width: MediaQuery.sizeOf(context).width,
                height: 150,
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Age",
                          style: TextStyle(
                              color: Appcolor.secondarycolor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          age,
                          style: TextStyle(
                              color: Appcolor.secondarycolor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Total Orders",
                          style: TextStyle(
                              color: Appcolor.secondarycolor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "5",
                          style: TextStyle(
                              color: Appcolor.secondarycolor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 55,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Total Price",
                          style: TextStyle(
                              color: Appcolor.secondarycolor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "1800\$",
                          style: TextStyle(
                              color: Appcolor.secondarycolor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
