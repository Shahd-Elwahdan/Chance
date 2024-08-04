// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors, unused_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Blogic/firbases/firestore.dart';
import 'package:myapp/home.dart';
import 'package:myapp/theme/theme.dart';

class Profilesettings extends StatefulWidget {
  const Profilesettings({super.key});
  @override
  State<Profilesettings> createState() => _ProfilesettingsState();
}

class _ProfilesettingsState extends State<Profilesettings> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    age.dispose();
    phone.dispose();
  }

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
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Profile Info',
            style: GoogleFonts.oswald(
                textStyle:
                    TextStyle(color: Appcolor.secondarycolor, fontSize: 40)),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVhml9c3umS8HbHT8dRrbpkWIzn8yX0nWVNYBcIJAn0bj4-DOL39OZR2sVIRRumXjGnTI&usqp=CAU"),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                label: Text(
                  'Full Name',
                  style: TextStyle(color: Appcolor.secondarycolor),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Appcolor.secondarycolor, width: 2)),
                prefixIcon: Icon(
                  Icons.person,
                  color: Appcolor.secondarycolor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: phone,
              decoration: InputDecoration(
                label: Text(
                  'Phone Number',
                  style: TextStyle(color: Appcolor.secondarycolor),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Appcolor.secondarycolor, width: 2)),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Appcolor.secondarycolor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: age,
              decoration: InputDecoration(
                label: Text(
                  'Age',
                  style: TextStyle(color: Appcolor.secondarycolor),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Appcolor.secondarycolor, width: 2)),
                prefixIcon: Icon(
                  CupertinoIcons.arrowshape_turn_up_right,
                  color: Appcolor.secondarycolor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Appcolor.secondarycolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {
              try {
                FireStore.Adduser(name.text, phone.text, age.text);
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>Homescreen()));
              } catch (e) {
                print(e);
              }
            },
            child: Text(
              "Submit",
              style: TextStyle(color: Appcolor.primarycolor, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
