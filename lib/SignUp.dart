// ignore_for_file: camel_case_types, prefer_const_constructors, sort_child_properties_last, unnecessary_import, file_names, prefer_const_literals_to_create_immutables, avoid_print, prefer_interpolation_to_compose_strings, unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/Blogic/firbases/Auth.dart';
import 'package:myapp/login.dart';
import 'package:myapp/profileset.dart';
import 'package:myapp/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class signupscreen extends StatefulWidget {
  const signupscreen({super.key});
  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
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
                width: 15,
              ),
              Text(
                'Create\nAccount',
                style: TextStyle(
                    color: Appcolor.secondarycolor,
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0, // shadow blur
                        color: Colors.deepPurple.shade400, // shadow color
                        offset:
                            Offset(2.0, 2.0), // how much shadow will be shown
                      ),
                    ]),
                textAlign: TextAlign.left,
              ),
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
          SizedBox(height: 2),
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
                    Authentication.createuser(emailcontroller.text.trim(),passwordcontroller.text.trim());
                    print("email" + emailcontroller.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profilesettings()));
                  } catch (e) {
                    print(e);
                  }
                },
                child: Container(
                  width: 300,
                  height: 45,
                  child: Text(
                    "Create Account",
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
                onTap: () {},
                child: Container(
                  width: 300,
                  height: 45,
                  child: Text(
                    "Sign Up With Google",
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
                "Already Have an Account ?",
                style: TextStyle(
                  color: const Color.fromARGB(255, 95, 93, 93),
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
                },
                child: Text(
                  "Log In ",
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
