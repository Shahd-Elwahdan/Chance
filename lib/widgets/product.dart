// ignore_for_file: camel_case_types, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:myapp/Model/product.dart';
import 'package:myapp/product.dart';
import 'package:myapp/theme/theme.dart';

class productw extends StatefulWidget {
  productw({super.key, required this.product});
  Product product;
  @override
  State<productw> createState() => _productwState();
}

class _productwState extends State<productw> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => productscreen(product: widget.product,)));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Appcolor.primarycolor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Appcolor.tertiarycolor,
                  blurRadius: 3,
                  offset: Offset(1, 2))
            ],
            border: Border.all(width: 2, color: Appcolor.tertiarycolor)),

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                width: 140,
                height: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.product.productimage1!),
                      ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            Text(widget.product.productname!,
                style:
                    TextStyle(color: Appcolor.quaternarycolor, fontSize: 16,fontWeight: FontWeight.bold)),
            Text("${widget.product.productprice?.toInt()}£",
                style:
                    TextStyle(color: Appcolor.quaternarycolor, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
