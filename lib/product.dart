// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace, unused_local_variable, must_be_immutable, avoid_print
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/Blogic/firbases/firestore.dart';
import 'package:myapp/Model/cartItems.dart';
import 'package:myapp/Model/product.dart';
import 'package:myapp/theme/theme.dart';

class productscreen extends StatefulWidget {
  productscreen({super.key, required this.product});
  Product product;
  @override
  State<productscreen> createState() => _productscreenState();
}

class _productscreenState extends State<productscreen> {
  int index = 0;
  int indexcolor = 0;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    String defimg = widget.product.productimage1!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (index == 0) ...{
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 420,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.product.productimage1!),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(
                              radius: 17,
                              backgroundColor: Appcolor.primarycolor,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Appcolor.secondarycolor,
                                    size: 21,
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 270,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 340,
                            ),
                            IconButton(
                                onPressed: () {
                                  FireStore.AddtoWishlist(
                                      widget.product.productname!,
                                      widget.product.productdescription!,
                                      widget.product.productprice!,
                                      widget.product.productoldprice!,
                                      widget.product.productimage1!,
                                      widget.product.productimage2!,
                                      widget.product.productimage3!);
                                  Fluttertoast.showToast(
                                    msg: "Item successfully added to WishList",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    backgroundColor: Colors.white,
                                    textColor: Appcolor.secondarycolor,
                                    fontSize: 16.0,
                                  );
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                ))
                          ],
                        ),
                      ],
                    )),
              ),
            },
            if (index == 1) ...{
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.product.productimage2!),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(
                              radius: 17,
                              backgroundColor: Appcolor.primarycolor,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Appcolor.secondarycolor,
                                    size: 21,
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 270,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 340,
                            ),
                            IconButton(
                                onPressed: () {
                                  FireStore.AddtoWishlist(
                                      widget.product.productname!,
                                      widget.product.productdescription!,
                                      widget.product.productprice!,
                                      widget.product.productoldprice!,
                                      widget.product.productimage1!,
                                      widget.product.productimage2!,
                                      widget.product.productimage3!);
                                  Fluttertoast.showToast(
                                    msg: "Item successfully added to WishList",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    backgroundColor: Colors.white,
                                    textColor: Appcolor.secondarycolor,
                                    fontSize: 16.0,
                                  );
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                ))
                          ],
                        ),
                      ],
                    )),
              ),
            },
            if (index == 2) ...{
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.product.productimage3!),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(
                              radius: 17,
                              backgroundColor: Appcolor.primarycolor,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Appcolor.secondarycolor,
                                    size: 21,
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 270,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 340,
                            ),
                            IconButton(
                                onPressed: () {
                                  FireStore.AddtoWishlist(
                                      widget.product.productname!,
                                      widget.product.productdescription!,
                                      widget.product.productprice!,
                                      widget.product.productoldprice!,
                                      widget.product.productimage1!,
                                      widget.product.productimage2!,
                                      widget.product.productimage3!);
                                  Fluttertoast.showToast(
                                    msg: "Item successfully added to WishList",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    backgroundColor: Colors.white,
                                    textColor: Appcolor.secondarycolor,
                                    fontSize: 16.0,
                                  );
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                ))
                          ],
                        ),
                      ],
                    )),
              ),
            },
            Row(
              children: [
                SizedBox(
                  width: 120,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      defimg = widget.product.productimage2!;
                      index = 1;
                    });
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.product.productimage2!),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      defimg = widget.product.productimage3!;
                      index = 2;
                    });
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.product.productimage3!),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 400,
                  child: Row(
                    children: [
                      Text(
                        widget.product.productname!,
                        style: TextStyle(
                            color: Appcolor.quaternarycolor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 330,
                  child: Text(
                    widget.product.productdescription!,
                    style: TextStyle(
                      color: Appcolor.secondarycolor,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${widget.product.productprice?.toInt()}£",
                  style: TextStyle(
                      color: Appcolor.quaternarycolor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${widget.product.productoldprice?.toInt()}£",
                  style: TextStyle(
                      color: Color.fromARGB(255, 123, 121, 121),
                      fontSize: 25,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Choose Size",
                  style: TextStyle(
                      color: Appcolor.quaternarycolor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () {
                    widget.product.productsize = "XS";
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    child: Center(
                        child: Text(
                      "XS",
                      style: TextStyle(
                          color: Appcolor.quaternarycolor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    decoration: BoxDecoration(
                        color: Appcolor.primarycolor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Appcolor.tertiarycolor,
                              blurRadius: 1,
                              offset: Offset(1, 2))
                        ],
                        border: Border.all(
                            width: 2, color: Appcolor.quaternarycolor)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    widget.product.productsize = "S";
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    child: Center(
                        child: Text(
                      "S",
                      style: TextStyle(
                          color: Appcolor.quaternarycolor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    decoration: BoxDecoration(
                        color: Appcolor.primarycolor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Appcolor.tertiarycolor,
                              blurRadius: 1,
                              offset: Offset(1, 2))
                        ],
                        border: Border.all(
                            width: 2, color: Appcolor.quaternarycolor)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    widget.product.productsize = "M";
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    child: Center(
                        child: Text(
                      "M",
                      style: TextStyle(
                          color: Appcolor.quaternarycolor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    decoration: BoxDecoration(
                        color: Appcolor.primarycolor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Appcolor.tertiarycolor,
                              blurRadius: 1,
                              offset: Offset(1, 2))
                        ],
                        border: Border.all(
                            width: 2, color: Appcolor.quaternarycolor)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    widget.product.productsize = "L";
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    child: Center(
                        child: Text(
                      "L",
                      style: TextStyle(
                          color: Appcolor.quaternarycolor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    decoration: BoxDecoration(
                        color: Appcolor.primarycolor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Appcolor.tertiarycolor,
                              blurRadius: 1,
                              offset: Offset(1, 2))
                        ],
                        border: Border.all(
                            width: 2, color: Appcolor.quaternarycolor)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    widget.product.productsize = "XL";
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    child: Center(
                        child: Text(
                      "XL",
                      style: TextStyle(
                          color: Appcolor.quaternarycolor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    decoration: BoxDecoration(
                        color: Appcolor.primarycolor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Appcolor.tertiarycolor,
                              blurRadius: 1,
                              offset: Offset(1, 2))
                        ],
                        border: Border.all(
                            width: 2, color: Appcolor.quaternarycolor)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    widget.product.productsize = "2XL";
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    child: Center(
                        child: Text(
                      "2XL",
                      style: TextStyle(
                          color: Appcolor.quaternarycolor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    decoration: BoxDecoration(
                        color: Appcolor.primarycolor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Appcolor.tertiarycolor,
                              blurRadius: 1,
                              offset: Offset(1, 2))
                        ],
                        border: Border.all(
                            width: 2, color: Appcolor.quaternarycolor)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 140,
                  height: 45,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              count++;
                            });
                          },
                          highlightColor: Appcolor.tertiarycolor,
                          icon: Icon(
                            Icons.add,
                            color: Appcolor.quaternarycolor,
                            size: 26,
                          )),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        count.toString(),
                        style: TextStyle(
                            color: Color.fromARGB(255, 83, 83, 83),
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              count--;
                            });
                          },
                          highlightColor: Appcolor.tertiarycolor,
                          icon: Icon(
                            Icons.remove,
                            color: Appcolor.quaternarycolor,
                            size: 26,
                          )),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Appcolor.primarycolor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Appcolor.tertiarycolor,
                            blurRadius: 1,
                            offset: Offset(1, 2))
                      ],
                      border: Border.all(
                          width: 2, color: Appcolor.quaternarycolor)),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    try {
                      cartitem!.add(CartItem(
                          name: widget.product.productname,
                          img: widget.product.productimage1,
                          count: count,
                          Singleprice: widget.product.productprice!.toDouble(),
                          totalprice:
                              widget.product.productprice!.toInt() * count,
                          size: widget.product.productsize));
                      print(cartitem!.length);
                      Fluttertoast.showToast(
                        msg: "Item successfully added to cart.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.white,
                        textColor: Appcolor.secondarycolor,
                        fontSize: 16.0,
                      );
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Container(
                    width: 180,
                    height: 45,
                    child: Center(
                      child: Text(
                        "Add to cart",
                        style: TextStyle(
                            color: Appcolor.primarycolor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Appcolor.quaternarycolor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Appcolor.tertiarycolor,
                              blurRadius: 1,
                              offset: Offset(1, 2))
                        ],
                        border: Border.all(
                            width: 2, color: Appcolor.quaternarycolor)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
