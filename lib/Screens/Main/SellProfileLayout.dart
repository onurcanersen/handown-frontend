import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class SellProfileLayout extends StatelessWidget {
  const SellProfileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: Column(
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
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                //Buradan sonrasını hardcode yazdım, database entegrasyonunda düzenleriz
                itemCount: 3, //hardcode
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                          leading: Image.asset(
                            'assets/images/gamepad.png',
                            height: 36,
                          ),
                          title: const Text(
                            'Product Name',
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: const Text(
                            '\$' + 'Price',
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: const Icon(Icons.cancel)),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
