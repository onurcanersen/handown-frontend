import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handown/Screens/Main/AnotherProductLayout.dart';

class SellProfileLayout extends StatefulWidget {
  SellProfileLayout(
      {Key? key,
      required this.userEmail,
      required this.userName,
      required this.userSurname})
      : super(key: key);

  final String userEmail;
  final String userName;
  final String userSurname;

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
                  itemCount: 7, //hardcode
                  padding: EdgeInsets.all(size.height * 0.015),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(size.height * 0.02),
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
                        //Trailing aslında aşağıdaki gibi olmalı ama  şu an böyle değil
                        /*trailing: IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () =>
                                Provider.of<CartModel>(context, listen: false)
                                    .removeItemFromCart(index),
                          ),*/
                      ),
                    );
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
