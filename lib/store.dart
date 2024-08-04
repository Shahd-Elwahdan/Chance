// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/categoryy.dart';
import 'package:myapp/theme/theme.dart';

class storescreen extends StatefulWidget {
  const storescreen({super.key});

  @override
  State<storescreen> createState() => _storescreenState();
}

class _storescreenState extends State<storescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Store",
            style: GoogleFonts.josefinSans(
                textStyle:
                    TextStyle(color: Appcolor.secondarycolor, fontSize: 30)),
          ),
        centerTitle: true,
        ),
        body: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("bottoms").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(60),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 60.0, // Horizontal space between items
                      mainAxisSpacing: 60.0, // Number of items per row
                    ),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Appcolor.primarycolor,
                            borderRadius: BorderRadius.circular(10),
                            
                            boxShadow: [
                              BoxShadow(
                                color: Appcolor.tertiarycolor,
                                blurRadius: 3,
                                offset: Offset(1, 2),
                              ),
                            ],
                            border: Border.all(
                              width: 2,
                              color: Appcolor.tertiarycolor,
                            ),
                            
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      snapshot.data?.docs[index]["img1"],
                                    ),
                                  fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                snapshot.data?.docs[index]["name"],
                                style: TextStyle(
                                  color: Appcolor.quaternarycolor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            
          ],
        ));
  }
}
