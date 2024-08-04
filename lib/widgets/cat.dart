// ignore_for_file: prefer_const_constructors, unnecessary_import, must_be_immutable, camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myapp/Model/Category.dart';
import 'package:myapp/categoryy.dart';
import 'package:myapp/theme/theme.dart';

class cat extends StatefulWidget {
  cat({super.key, required this.category});
  Categoryy category;

  @override
  State<cat> createState() => _catState();
}

class _catState extends State<cat> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Categoryscreen(
                    name:widget.category.name,
                    ff: widget.category.si,
                    
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Appcolor.tertiarycolor,
                      blurRadius: 3,
                      offset: Offset(1, 2))
                ],
                shape: BoxShape.circle,
                border: Border.all(
                  color: Appcolor.secondarycolor,
                  width: .7,
                ),
              ),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(widget.category.image),
              ),
            ),
            Text(
              widget.category.name,
              style: TextStyle(
                  color: Appcolor.secondarycolor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
