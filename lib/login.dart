// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_import, camel_case_types, prefer_interpolation_to_compose_strings, avoid_print, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Blogic/firbases/Auth.dart';
import 'package:myapp/SignUp.dart';
import 'package:myapp/home.dart';
import 'package:myapp/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  String? email;
  String? pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Appcolor.quaternarycolor,
                  ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 140,
              ),
              Text(
                'Chance',
                style: GoogleFonts.lobster(
                  textStyle: TextStyle(
                    color: Color.fromRGBO(87, 79, 125, 1),
                    fontSize: 45,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0, // shadow blur
                        color: Colors.deepPurple.shade400, // shadow color
                        offset:
                            Offset(2.0, 2.0), // how much shadow will be shown
                      ),
                    ],
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
              ),
              Text(
                "Log in with your account",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Appcolor.secondarycolor),
              )
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                'Email',
                style: TextStyle(
                    color: Appcolor.quaternarycolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) {
                email = value;
              },
              controller: emailcontroller,
              decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  labelStyle: TextStyle(color: Appcolor.quaternarycolor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Appcolor.quaternarycolor)),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Appcolor.quaternarycolor,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon:
                          Icon(Icons.clear, color: Appcolor.quaternarycolor))),
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                'Password',
                style: TextStyle(
                    color: Appcolor.quaternarycolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) {
                pass = value;
              },
              controller: passwordcontroller,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  labelStyle: TextStyle(color: Appcolor.quaternarycolor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Appcolor.quaternarycolor)),
                  prefixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Appcolor.quaternarycolor,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon:
                          Icon(Icons.clear, color: Appcolor.quaternarycolor))),
            ),
          ),
          SizedBox(height: 60),
          Row(
            children: [
              SizedBox(width: 60),
              GestureDetector(
                onTap: () {
                  try {
                    if (email == null ||
                        pass == null) {
                      setState(() {
                        Fluttertoast.showToast(
                          msg: "enter your email and password",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Color.fromARGB(154, 172, 8, 8),
                          textColor: Appcolor.primarycolor,
                          fontSize: 16.0,
                        );
                      });
                    } else {
                      Authentication.login(emailcontroller.text.trim(),
                          passwordcontroller.text.trim());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Homescreen()));
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Container(
                  width: 300,
                  height: 45,
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(1, 2)),
                      ],
                      color: Appcolor.secondarycolor,
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(width: 3, color: Appcolor.secondarycolor)),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 60),
              GestureDetector(
                onTap: () async {
                  try {
                    Authentication.signInWithGoogle();
                    if (auth.currentUser != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Homescreen()));
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Container(
                  width: 300,
                  height: 45,
                  child: Text(
                    "Log In With Google",
                    style: TextStyle(
                      color: Appcolor.secondarycolor,
                      fontSize: 21,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(1, 2)),
                      ],
                      color: Appcolor.primarycolor,
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(width: 3, color: Appcolor.secondarycolor)),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "Don't Have an Account ?",
                style: TextStyle(
                  color: const Color.fromARGB(255, 95, 93, 93),
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => signupscreen()));
                },
                child: Text(
                  "Sign Up ",
                  style: TextStyle(
                      color: Appcolor.secondarycolor,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
