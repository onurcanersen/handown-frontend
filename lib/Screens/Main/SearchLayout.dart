import 'package:flutter/material.dart';
import 'package:handown/Screens/Main/CartLayout.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:handown/Components/shopping_item.dart';
import 'package:provider/provider.dart';
import 'package:handown/Models/shopping_model.dart';

class SearchLayout extends StatefulWidget {
  const SearchLayout({Key? key}) : super(key: key);

  @override
  State<SearchLayout> createState() => _SearchLayoutState();
}

class _SearchLayoutState extends State<SearchLayout> {
  var products = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const CartLayout();
              },
            ),
          ),
          child: const Icon(Icons.shopping_bag),
        );
      }),
      body: Padding(
        padding: EdgeInsets.only(
          left: size.height * 0.025,
          right: size.height * 0.025,
          bottom: size.height * 0.025,
          top: size.height * 0.04,
        ),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Search For Anything',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.015),
            TextField(
              onSubmitted: (value) async {
                final response = await http.post(
                  Uri.parse(
                      'https://us-central1-handown.cloudfunctions.net/products/search'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    "product_name": value,
                  }),
                );
                if (response.statusCode == 200) {
                  setState(() {
                    products = jsonDecode(response.body);
                  });
                }
              },
              style: const TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                fillColor: const Color(0xffd7e4e7),
                filled: true,
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.white,
                hintText: 'The Joker Figure',
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(1),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1,
              ),
              itemBuilder: (context, index) {
                final path;
                if (products[index]["product_name"] == "boot" || products[index]["product_name"] == "shirt" || 
                    products[index]["product_name"] == "laptop" || products[index]["product_name"] == "phone" || products[index]["product_name"] == "gamepad"){
                      path = products[index]["product_name"];
                }
                else{
                      path = "handown";
                }
                return ShoppingItemTile(
                  itemName: products[index]["product_name"],
                  itemPrice: products[index]["product_price"],
                  imagePath: "assets/images/" + path + ".png",
                  color: Colors.green,
                  onPressed: () =>
                      Provider.of<CartModel>(context, listen: false)
                          .addItemToCart(index),
                );
              },
            ),

            //Bu expanded değişecek abi yoksa aşağıya kaymıyor
            Expanded(
              child: ListView(),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
