import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handown/Screens/Main/AnotherProductLayout.dart';
import 'package:handown/Screens/Main/CartLayout.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SellProfileLayout extends StatefulWidget {
  SellProfileLayout(
      {Key? key,
      required this.userEmail,
      required this.userName,
      required this.userSurname,
      required this.itemCount,
      required this.products})
      : super(key: key);

  final String userEmail;
  final String userName;
  final String userSurname;
  final int itemCount;
  final List<dynamic> products;

  @override
  State<SellProfileLayout> createState() => _SellProfileLayoutState();
}

class _SellProfileLayoutState extends State<SellProfileLayout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const Color appBarColor = Color(0xff252525);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Products",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(size.height * 0.015),
                child: ListView.builder(
                  //Buradan sonrasını hardcode yazdım, database entegrasyonunda düzenleriz
                  itemCount: widget.itemCount, //hardcode
                  padding: EdgeInsets.all(size.height * 0.015),
                  itemBuilder: (context, index) {
                    
                    String name = widget.products[index]["product_name"];
                    String price = widget.products[index]["product_price"];

                    final path;
                    if (widget.products[index]["product_name"] == "boot" || widget.products[index]["product_name"] == "shirt" || 
                        widget.products[index]["product_name"] == "laptop" || widget.products[index]["product_name"] == "phone" || widget.products[index]["product_name"] == "gamepad"){
                          path = widget.products[index]["product_name"];
                    }
                    else{
                          path = "handown";
                    }
                    
                    return Padding(
                      padding: EdgeInsets.all(size.height * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8)),
                        child: ListTile(
                            leading: Image.asset(
                              "assets/images/" + path + ".png",
                              height: 36,
                            ),
                            title: Text(
                              name,
                              style: TextStyle(fontSize: 18)
                            ),
                            subtitle: Text(
                              '\$' + price,
                              style: TextStyle(fontSize: 12),
                            ),
                            //trailing: const Icon(Icons.cancel)),
                        //Trailing aslında aşağıdaki gibi olmalı ama  şu an böyle değil
                        /*trailing: IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () =>
                                Provider.of<CartModel>(context, listen: false)
                                    .removeItemFromCart(index),
                          ),*/
                      ),
                    ));
                  },
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.height * 0.024,
                  right: size.height * 0.024,
                  bottom: size.height * 0.05,
                  top: size.height * 0.012,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: appBarColor,
                  ),
                  child: TextButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.017,
                          horizontal: size.height * 0.135),
                      child: const Text(
                        'Add Another Product',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AnotherProductLayout(
                                userEmail: widget.userEmail,
                                userName: widget.userName,
                                userSurname: widget.userSurname);
                          },
                        ),
                      ),
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}