import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handown/Screens/Main/CartLayout.dart';
import 'package:handown/Screens/Main/HomeLayout.dart';
import 'package:handown/Screens/Main/SearchLayout.dart';
import 'package:provider/provider.dart';
import 'package:handown/Models/shopping_model.dart';

class PaymentLayout extends StatefulWidget {
  const PaymentLayout({Key? key}) : super(key: key);

  @override
  State<PaymentLayout> createState() => _PaymentLayoutState();
}

class _PaymentLayoutState extends State<PaymentLayout> {
  static final formGlobalKey4 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const Color appBarColor = Color(0xff252525);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Form(
              key: formGlobalKey4,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/credit_card.png",
                    fit: BoxFit.fill,
                  ),
                  const Align(
                    alignment: Alignment(-0.80, 0),
                    child: Text("Number on the Card",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 15.5,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: size.height * 0.015),
                  SizedBox(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    child: TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      validator: (sValue) {
                        if (sValue == null || sValue.isEmpty) {
                          return 'Please enter a meaningful text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: "1234 5678 9876 5432"),
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  Row(
                    children: <Widget>[
                      SizedBox(width: size.height * 0.06),
                      Column(
                        children: <Widget>[
                          const Align(
                            alignment: Alignment(-0.80, 0),
                            child: Padding(
                              padding: EdgeInsets.only(right: 100.0),
                              child: Text("Date",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15.5,
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          SizedBox(height: size.height * 0.015),
                          SizedBox(
                            height: size.height * 0.08,
                            width: size.width * 0.35,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (sValue) {
                                if (sValue == null || sValue.isEmpty) {
                                  return 'Please enter a meaningful text';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: "12/99"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: size.height * 0.052),
                      Column(
                        children: <Widget>[
                          const Align(
                            alignment: Alignment(-0.80, 0),
                            child: Padding(
                              padding: EdgeInsets.only(right: 100.0),
                              child: Text("CVC",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15.5,
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          SizedBox(height: size.height * 0.015),
                          SizedBox(
                            height: size.height * 0.08,
                            width: size.width * 0.35,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (sValue) {
                                if (sValue == null || sValue.isEmpty) {
                                  return 'Please enter a meaningful text';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: "123"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.015),
                  const Align(
                    alignment: Alignment(-0.80, 0),
                    child: Text("Name on the Card",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 15.5,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: size.height * 0.015),
                  SizedBox(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    child: TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      validator: (sValue) {
                        if (sValue == null || sValue.isEmpty) {
                          return 'Please enter a meaningful text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: "MAX MUSTERMANN"),
                    ),
                  ),
                  SizedBox(height: size.height * 0.025),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: appBarColor,
                    ),
                    child: TextButton(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.017,
                            horizontal: size.height * 0.13),
                        child: const Text(
                          'Finish The Payment',
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
                              return SearchLayout();
                            },
                          ),
                        ),
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
