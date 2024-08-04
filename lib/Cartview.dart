// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/Model/cartItems.dart';
import 'package:myapp/address.dart';
import 'package:myapp/home.dart';
import 'package:myapp/theme/theme.dart';

class Cartview extends StatefulWidget {
  const Cartview({super.key});
  
  @override
  State<Cartview> createState() => _CartviewState();
}

class _CartviewState extends State<Cartview> {
  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in cartitem!) {
      total += item.totalprice!;
    }
    return total;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Cart",
          style: TextStyle(
              color: Appcolor.secondarycolor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      floatingActionButton: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Appcolor.primarycolor,
          ),
          child: Row(children: [
            SizedBox(
              width: 25,
            ),
            Text(
              "Total Price",
              style: TextStyle(
                  color: Appcolor.secondarycolor,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              "${calculateTotalPrice().toInt()} £",
              style: TextStyle(
                  color: Appcolor.secondarycolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 20,
            ),
            Center(
                child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => address(total: calculateTotalPrice().toInt(),)));
              },
              child: Container(
                width: 150,
                height: 50,
                child: Center(
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Appcolor.secondarycolor,
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(width: 3, color: Appcolor.secondarycolor)),
              ),
            )),
          ])),
      body: Column(
        children: [
          Container(
            child: Expanded(
              child: ListView.builder(
                  itemCount: cartitem!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image(
                        image: NetworkImage(
                            cartitem![index].img!),
                      ),
                      title: Text(
                          "${cartitem![index].name!}     ${cartitem![index].size}"),
                      subtitle: Text(
                          "X${cartitem![index].count}   ${cartitem![index].Singleprice}£                     ${cartitem![index].totalprice}\$"),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 183, 179, 179),
                        ),
                        onPressed: () {
                          cartitem!.removeAt(index);
                        },
                      ),
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 30,
          ),
 

        ],
      ),
    );
  }
}
