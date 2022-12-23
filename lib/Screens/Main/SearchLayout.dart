import 'package:flutter/material.dart';

class SearchLayout extends StatefulWidget {
  const SearchLayout({Key? key}) : super(key: key);

  @override
  State<SearchLayout> createState() => _SearchLayoutState();
}

class _SearchLayoutState extends State<SearchLayout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: size.height * 0.025,
          right: size.height * 0.025,
          bottom: size.height * 0.025,
          top: size.height * 0.080,
        ),
        child: Column(
          children: [
            Center(
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
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                fillColor: Color(0xffd7e4e7),
                filled: true,
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.white,
                hintText: 'The Joker Figure',
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
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
