// ignore_for_file: use_function_type_syntax_for_parameters, prefer_const_constructors, sort_child_properties_last, unused_local_variable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Blogic/firbases/firestore.dart';
import 'package:myapp/Cartview.dart';
import 'package:myapp/Model/cartItems.dart';
import 'package:myapp/home.dart';
import 'package:myapp/theme/theme.dart';

class address extends StatefulWidget {
  address({super.key, required this.total ,});
  int total;
  @override
  State<address> createState() => _addressState();
}

class _addressState extends State<address> {
  List<String> items = ["Damitta", "Alexandria", "Cairo", "Other"];
  String? selecteditem = "Damitta";
  String? firstname = "";
  String? secondname = "";
  String? city = "";
  String? fulladdress = "";
  String? phonenum = "";
  String? order = "";
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Required Info',
              style: GoogleFonts.oswald(
                  textStyle:
                      TextStyle(color: Appcolor.secondarycolor, fontSize: 40)),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 360,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          firstname = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text(
                          'First Name',
                          style: TextStyle(color: Appcolor.secondarycolor),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Appcolor.secondarycolor, width: 2)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Appcolor.secondarycolor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 360,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          secondname = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text(
                          'Second Name',
                          style: TextStyle(color: Appcolor.secondarycolor),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Appcolor.secondarycolor, width: 2)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Appcolor.secondarycolor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 240,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              label: Text(
                                'City',
                                style:
                                    TextStyle(color: Appcolor.secondarycolor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Appcolor.secondarycolor))),
                          value: selecteditem,
                          items: items
                              .map(
                                (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                    )),
                              )
                              .toList(),
                          onChanged: (item) =>
                              setState(() => city = selecteditem),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 360,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          fulladdress = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text(
                          'Full Address',
                          style: TextStyle(color: Appcolor.secondarycolor),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Appcolor.secondarycolor, width: 2)),
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: Appcolor.secondarycolor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 360,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          phonenum = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text(
                          'Phone Number',
                          style: TextStyle(color: Appcolor.secondarycolor),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Appcolor.secondarycolor, width: 2)),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Appcolor.secondarycolor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    width: 320,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(171, 214, 214, 214),
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Color.fromARGB(144, 74, 5, 120))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Price :                   ${widget.total} £",
                          style: TextStyle(
                            color: Appcolor.quaternarycolor,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Tax :                         40£",
                          style: TextStyle(
                            color: Appcolor.quaternarycolor,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Delivery :                 60£",
                          style: TextStyle(
                            color: Appcolor.quaternarycolor,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1,
                          width: 270,
                          decoration: BoxDecoration(
                              color: Appcolor.secondarycolor,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Appcolor.secondarycolor)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Total :          ${(widget.total)+100}",
                          style: TextStyle(
                              color: Appcolor.quaternarycolor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 37),
                      GestureDetector(
                        onTap: () {
                          try {
                            for (var index in cartitem!) {
                              order =
                                  "${order!}  ${index.size}  X${index.count}  ${index.name}\n ";
                            }
                            FireStore.Addorder(
                                ("${firstname!}  ${secondname!}"),
                                city!,
                                fulladdress!,
                                phonenum!,
                                (widget.total)+100,
                                order!);
                            Fluttertoast.showToast(
                              msg:
                                  "your order has been confirmed successfully.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              backgroundColor: Colors.white,
                              textColor: Appcolor.secondarycolor,
                              fontSize: 16.0,
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homescreen()));
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: Container(
                          width: 130,
                          height: 45,
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.bold),
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
                              border: Border.all(
                                  width: 3, color: Appcolor.secondarycolor)),
                        ),
                      ),
                      SizedBox(width: 40),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 130,
                          height: 45,
                          child: Text(
                            "Cancle",
                            style: TextStyle(
                                color: Appcolor.secondarycolor,
                                fontSize: 21,
                                fontWeight: FontWeight.bold),
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
                              border: Border.all(
                                  width: 3, color: Appcolor.secondarycolor)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
