// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/home.dart';
import 'package:myapp/main.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
          backgroundColor: Colors.white,
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
          },
          childWidget: Text(
                'Chance',
                style: GoogleFonts.lobster(
                  textStyle: TextStyle(
                    color: Color.fromRGBO(87, 79, 125, 1),
                    fontSize: 90,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0, 
                        color: Colors.deepPurple.shade400,
                        offset:
                            Offset(2.0, 2.0), // how much shadow will be shown
                      ),
                    ],
                  ),
                ),
                textAlign: TextAlign.center,
              ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen:FirebaseAuth.instance.currentUser==null
          ? MyHomePage()
          :Homescreen(),
        
    ));
  }
}