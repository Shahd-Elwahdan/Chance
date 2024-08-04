// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/SignUp.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/login.dart';
import 'package:myapp/splash.dart';
import 'package:myapp/theme/theme.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:splashscreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // const MyHomePage({super.key, required this.title});
  // final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Column(
        children: [
          Center(
            child: Image(
              image: NetworkImage(
                  "https://img.freepik.com/free-vector/online-ordering-purchase-making-buying-goods-internet-store-website-female-customer-with-tablet-adding-product-cart-cartoon-character-vector-isolated-concept-metaphor-illustration_335657-2840.jpg?w=740&t=st=1720742902~exp=1720743502~hmac=814579e98dbf88a929fdd8e1f0c41c398b668b916d559d53975daadcf1f589b8"),
            ),
          ),
          Row(
            children: [
              SizedBox(height: 20, width: 80),
              Container(
                child: Text(
                  'Chance',
                  style: GoogleFonts.lobster(
                    textStyle: TextStyle(
                      color: Color.fromRGBO(87, 79, 125, 1),
                      fontSize: 90,
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
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Container(
            child: Text(
              "It's Your Chance",
              style: GoogleFonts.lobster(
                textStyle: TextStyle(
                  color: Color.fromRGBO(87, 79, 125, 1),
                  fontSize: 20,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 70,
                height: 150,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => signupscreen()));
                },
                child: Container(
                  width: 100,
                  height: 40,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple.shade300,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 3, color: Colors.deepPurple.shade300)),
                ),
              ).animate().fade(duration: 2.seconds),
              SizedBox(
                width: 60,
                height: 150,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
                },
                child: Container(
                  width: 100,
                  height: 40,
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.deepPurple.shade300,
                      fontSize: 21,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                      color: Appcolor.primarycolor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 3, color: Colors.deepPurple.shade300)),
                ),
              ).animate().fade(duration: 2.seconds)
            ],
          )
        ],
      ),
    );
  }
}
