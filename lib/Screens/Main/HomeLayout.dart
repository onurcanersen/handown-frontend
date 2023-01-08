import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handown/Components/shopping_item.dart';
import 'package:handown/Models/shopping_model.dart';
import 'package:handown/Screens/Main/CartLayout.dart';
import 'package:handown/Screens/Main/PaymentLayout.dart';
import 'package:handown/Screens/Main/SearchLayout.dart';
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
    const Color appBarColor = Color(0xff252525);
    final List<String> imgList = [
      'assets/images/carousel_image.png',
      'assets/images/free_shipping.jpg',
      'assets/images/discount.jpg',
    ];

    return Scaffold(
      body: Column(
        children: [
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

          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
              'We deliver everything at your doorstep',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                  fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),

          // groceree gives you fresh vegetables and fruits
          Text(
            'Whatever you want',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[700],
            ),
          ),
          Text(
            "It's only up to you",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),

          const Spacer(),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                left: size.height * 0.024,
                right: size.height * 0.024,
                bottom: size.height * 0.05,
                top: size.height * 0.06,
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
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () => {
                    showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Hello'),
                      content: const Text('Welcome to the app, continue with search tab if you want to search products.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'I got it.'),
                          child: const Text('Cancel'),
                        ),
                      ],
                    ),
                  ),
                  },
                ),
              ),
            ),
          ),

          const Spacer(),
          //Burası biraz deneysel
        ],
      ),
    );
  }
}
