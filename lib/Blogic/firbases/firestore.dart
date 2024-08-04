// ignore_for_file: await_only_futures, non_constant_identifier_names, unused_local_variable, avoid_print, unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/Model/user.dart';

class FireStore {
  static final auth = FirebaseAuth.instance;
  String? name;
  String? age;
  String? phone;
  static Future<void> Add(String name, String phone, String age) async {
    await FirebaseFirestore.instance.collection('Users').add({
      'age': age,
      'username': name,
      'phone': phone,
    });
    print("Added");
  }
  static Future<void> AddtoWishlist(String name, String des, int price,int oldprice,String img1,String img2,String img3) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid).collection("wishlist").add({
          'name':name,
          'des': des,
          'price':price,
          'oldprice':oldprice,
          'img1':img1,
          'img2':img2,
          "img3":img3

   } );
    print("Added");
  }  
  

  static Future<void> Adduser(String name, String phone, String age) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .set({
      'age': age,
      'username': name,
      'phone': phone,
    });
    print("Added");
  }

  static Future<void> Addorder(String fullname, String cityy, String address,String phone,int Totalprice,String order) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid).collection("Orders").add({
          'fullname':fullname,
          'citty': cityy,
          'phone':phone,
          'address':address,
          "Totalprice":Totalprice,
          "order":order

   } );
    print("Added");
  }






}

