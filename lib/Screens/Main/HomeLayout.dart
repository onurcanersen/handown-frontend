import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:handown/Components/shopping_item.dart';
import 'package:handown/Models/shopping_model.dart';
import 'package:handown/Screens/Main/CartLayout.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<String> imgList = [
      'assets/images/carousel_image.png',
      'assets/images/free_shipping.jpg',
      'assets/images/discount.jpg',
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.04,
          ),
          CarouselSlider(
            items: imgList
                .map((item) => Center(
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        width: 1000,
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
          ),

          const Divider(
            thickness: 2.0,
          ),

          //Burası biraz deneysel

          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  padding: const EdgeInsets.all(6),
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1,
                  ),
                  itemBuilder: (context, index) {
                    return ShoppingItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () =>
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
