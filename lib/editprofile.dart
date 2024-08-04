// ignore_for_file: camel_case_types, prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Blogic/firbases/firestore.dart';
import 'package:myapp/home.dart';
import 'package:myapp/theme/theme.dart';

class edit_profile extends StatefulWidget {
  const edit_profile({super.key});
  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  static final auth = FirebaseAuth.instance;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  Future<void> Getuser() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          namecontroller.text = snapshot.data()!['username'];
          agecontroller.text = snapshot.data()!['age'];
          phonecontroller.text = snapshot.data()!['phone'];
        });
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                try {
                  FireStore.Adduser(namecontroller.text, phonecontroller.text,
                      agecontroller.text);
                  Fluttertoast.showToast(
                      msg: "Profile Updated",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Appcolor.tertiarycolor,
                      textColor: Appcolor.secondarycolor,
                      fontSize: 16.0);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homescreen()));
                } catch (e) {
                  print(e);
                }
              },
              icon: Icon(Icons.save, color: Appcolor.quaternarycolor))
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Edit Profile Info',
            style: GoogleFonts.oswald(
                textStyle:
                    TextStyle(color: Appcolor.secondarycolor, fontSize: 40)),
          ),
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
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 23,
              ),
              Text(
                'Full Name ',
                style: TextStyle(
                    color: Appcolor.secondarycolor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Appcolor.secondarycolor, width: 2)),
                prefixIcon: Icon(
                  Icons.person,
                  color: Appcolor.secondarycolor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SizedBox(
                width: 23,
              ),
              Text(
                'Phone Number ',
                style: TextStyle(
                    color: Appcolor.secondarycolor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: phonecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Appcolor.secondarycolor, width: 2)),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Appcolor.secondarycolor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SizedBox(
                width: 23,
              ),
              Text(
                'Age ',
                style: TextStyle(
                    color: Appcolor.secondarycolor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: agecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Appcolor.secondarycolor, width: 2)),
                prefixIcon: Icon(
                  CupertinoIcons.arrowshape_turn_up_right,
                  color: Appcolor.secondarycolor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
