// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Model/product.dart';
import 'package:myapp/product.dart';
import 'package:myapp/theme/theme.dart';
import 'package:myapp/widgets/product.dart';

class Categoryscreen extends StatefulWidget {
  Categoryscreen({
    super.key,
    required this.name,
    required this.ff,
  });
  String name;
  String ff;
  @override
  State<Categoryscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.name,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Appcolor.secondarycolor),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Appcolor.secondarycolor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Appcolor.primarycolor,
        ),
        body:
        StreamBuilder<QuerySnapshot>(
          
            stream:
                FirebaseFirestore.instance.collection(widget.ff).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text("No data available"));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var doc = snapshot.data!.docs[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => productscreen(
                                          product: Product(
                                        productimage1:
                                            snapshot.data?.docs[index]["img1"],
                                        productimage2:
                                            snapshot.data?.docs[index]["img2"],
                                        productimage3:
                                            snapshot.data?.docs[index]["img3"],
                                        productname: snapshot.data?.docs[index]
                                            ["name"],
                                        productprice: snapshot.data?.docs[index]
                                            ["price"],
                                        productoldprice: snapshot
                                            .data?.docs[index]["oldprice"],
                                        productdescription:
                                            snapshot.data?.docs[index]["des"],
                                      ))));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 150,
                                  child: Image.network(
                                    doc["img1"] ?? '',
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(Icons.error);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        doc["name"] ?? 'No name',
                                        style: TextStyle(
                                            color: Appcolor.secondarycolor,
                                            fontSize: 13),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "${doc["price"]?.toString() ?? '0.00'} £",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 151, 16, 16),
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
            }));
  }
}

//  Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Container(
//                               width: 150,
//                               child: Image(
//                                   image: NetworkImage(
//                                       "https://img1.etsystatic.com/057/2/5219993/il_fullxfull.691050105_ceut.jpg")),
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             Text(
//                               "Product Name",
//                               style: TextStyle(
//                                   color: Appcolor.secondarycolor, fontSize: 17),
//                             ),
//                             SizedBox(
//                               width: 50,
//                             ),
//                             Text(
//                               "200£",
//                               style: TextStyle(
//                                   color: Color.fromARGB(255, 151, 16, 16),
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//             ),
//           ],
//         )