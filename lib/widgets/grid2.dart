// ignore_for_file: prefer_const_constructors, unused_import, camel_case_types

import 'package:flutter/material.dart';
import 'package:myapp/theme/theme.dart';

class gridd extends StatefulWidget {
  const gridd({super.key});

  @override
  State<gridd> createState() => _griddState();
}

class _griddState extends State<gridd> {
  @override
  Widget build(BuildContext context) {
    return Container(
    width: 100,
    height: 80,
    child: Column(
      children: [
        Container(
          width: 100,
          height: 80,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://m.media-amazon.com/images/I/715sF3aGrZL._AC_SX679_.jpg"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(height: 5,),
        Text(
          "product name",
          style: TextStyle(
            color: Appcolor.quaternarycolor,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),

  );
  }
}
