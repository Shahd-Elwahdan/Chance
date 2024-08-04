// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_import

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Blogic/firbases/Auth.dart';
import 'package:myapp/Cartview.dart';
import 'package:myapp/Model/Category.dart';
import 'package:myapp/Model/product.dart';
import 'package:myapp/categoryy.dart';
import 'package:myapp/main.dart';
import 'package:myapp/product.dart';
import 'package:myapp/profile.dart';
import 'package:myapp/splash.dart';
import 'package:myapp/store.dart';
import 'package:myapp/theme/theme.dart';
import 'package:myapp/widgets/cat.dart';
import 'package:myapp/widgets/grid2.dart';
import 'package:myapp/widgets/product.dart';
import 'package:myapp/wishlist.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Categoryy> list = [
    Categoryy(
        name: "Dresses",
        image: "https://static.zara.net/assets/public/d25d/9277/3b924c58a9a0/9086b867962e/08372090800-e1/08372090800-e1.jpg?ts=1719314013576&w=563", si: 'dress'),
    Categoryy(
        name: "Blouses and Shirts",
        image: "https://static.zara.net/assets/public/82ce/07be/40d545fba85e/9fce33ef2d4e/08741256800-015-e1/08741256800-015-e1.jpg?ts=1707397061277&w=563", si: 'tops'),
    Categoryy(
        name: "Pants and skirts",
        image: "https://static.zara.net/assets/public/c0e3/345c/8b7b4e31be8c/7ad1fb830851/05427420800-e1/05427420800-e1.jpg?ts=1710404395374&w=563", si: 'bottoms'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Appcolor.secondarycolor,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.zero,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Appcolor.secondarycolor,
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => profilecsreen()),
                      );
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVhml9c3umS8HbHT8dRrbpkWIzn8yX0nWVNYBcIJAn0bj4-DOL39OZR2sVIRRumXjGnTI&usqp=CAU"),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: const Text(
                'My Profile',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => profilecsreen()),
                );
              },
            ),
            ListTile(
              style: ListTileStyle.list,
              leading: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              title: const Text(
                'Wish List',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => wishlist()),
                );
              },
            ),
            ListTile(
              style: ListTileStyle.list,
              leading: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              title: const Text(
                'Cart',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cartview()),
                );
              },
            ),
            ListTile(
              style: ListTileStyle.list,
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: const Text(
                'Log Out',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Authentication.signOut();
                if (FirebaseAuth.instance.currentUser == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => splashscreen()),
                  );
                }
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Chance',
          style: GoogleFonts.lobster(
            textStyle: TextStyle(
              color: Color.fromRGBO(87, 79, 125, 1),
              fontSize: 35,
              shadows: [
                Shadow(
                  blurRadius: 10.0, // shadow blur
                  color: Colors.deepPurple.shade400, // shadow color
                  offset: Offset(2.0, 2.0), // how much shadow will be shown
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cartview()),
              );
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Appcolor.secondarycolor,
              size: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://img.freepik.com/free-photo/woman-with-shopping-bags-looking-camera_23-2148316418.jpg?t=st=1722343368~exp=1722346968~hmac=183453d3896113163c602ecf42adb5512018f6d50f563e10e66a01933ea06cdb&w=900"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30
                  ),
                  
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Let your\nstyle speak \nfor itself",
                        style: GoogleFonts.oswald(
                            fontSize: 30, fontWeight: FontWeight.bold,
                            color: Appcolor.primarycolor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 90,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => storescreen()));
                        },
                        child: Container(
                          width: 180,
                          height: 40,
                          color: Colors.white,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Shop Now",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text("   Categories",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Appcolor.quaternarycolor,
                        fontSize: 25)),
              ],
            ),
            Container(
              height: 110,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return cat(
                      category: list[index],
                    );
                  }),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text("   Best Sellers",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Appcolor.quaternarycolor,
                        fontSize: 25)),
              ],
            ),
            Container(
                height: 212,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("MostOrdered")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: productw(
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
                          ),
                        );
                      },
                    );
                  },
                )),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text("   New Releases",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Appcolor.quaternarycolor,
                        fontSize: 25)),
              ],
            ),
            Container(
              height: 212,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("MostSale")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: productw(
                          product: Product(
                            productimage1: snapshot.data?.docs[index]["img1"],
                            productimage2: snapshot.data?.docs[index]["img2"],
                            productimage3: snapshot.data?.docs[index]["img3"],
                            productname: snapshot.data?.docs[index]["name"],
                            productprice: snapshot.data?.docs[index]["price"],
                            productoldprice:
                                snapshot.data?.docs[index]["oldprice"],
                            productdescription:
                                snapshot.data?.docs[index]["des"],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
