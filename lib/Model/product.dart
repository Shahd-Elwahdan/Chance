import 'dart:core';

import 'package:flutter/material.dart';

class Product {
  String? productimage1;
  String? productimage2;
  String? productimage3;
  String? productsize;

  String? productname;
  int? productprice;
  int? productoldprice;
  String? productdescription;
  String? productcategory;
  Color? producrcolor1;
  Color? producrcolor2;
  Color? producrcolor3;

  Product(
      {this.productimage1,
      this.productimage2,
      this.productimage3,
      this.productcategory,
      this.productdescription,
      this.productname,
      this.productoldprice,
      this.productprice,
      this.producrcolor1,
      this.producrcolor2,
      this.producrcolor3,
      this.productsize});
}
