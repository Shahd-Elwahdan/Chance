// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Model/product.dart';
import 'package:myapp/product.dart';
import 'package:myapp/theme/theme.dart';

class wishlist extends StatefulWidget {
  const wishlist({super.key});

  @override
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wish List",
          style: TextStyle(
              color: Appcolor.secondarycolor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Users").doc(auth.currentUser!.uid).collection("wishlist").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
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
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          productscreen(
                            product: Product(
                              productimage1:
                                  snapshot.data?.docs[index]["img1"],
                              productimage2:
                                  snapshot.data?.docs[index]["img2"],
                              productimage3:
                                  snapshot.data?.docs[index]["img3"],
                              productname:
                                  snapshot.data?.docs[index]["name"],
                              productprice:
                                  snapshot.data?.docs[index]["price"],
                              productoldprice:
                                  snapshot.data?.docs[index]["oldprice"],
                              productdescription:
                                  snapshot.data?.docs[index]["des"],
                            ),
                          ),));
                        },
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
                  ));
            }
          }),
    );
  }
}
