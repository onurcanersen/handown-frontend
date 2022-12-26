import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handown/Screens/Login/LoginLayout.dart';
import 'package:handown/Screens/Main/EditProfileLayout.dart';
import 'package:handown/Screens/Main/ProfileLayout.dart';

class AnotherProductLayout extends StatefulWidget {
  AnotherProductLayout(
      {Key? key,
      required this.userEmail,
      required this.userName,
      required this.userSurname})
      : super(key: key);

  final String userEmail;
  final String userName;
  final String userSurname;

  @override
  State<AnotherProductLayout> createState() => _AnotherProductLayoutState();
}

class _AnotherProductLayoutState extends State<AnotherProductLayout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const Color appBarColor = Color(0xff252525);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Form(
              child: SafeArea(
                child: Column(
                  children: [
                    Align(
                      alignment: const Alignment(-0.8, -0.2),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProfileLayout(
                                      userEmail: widget.userEmail,
                                      userName: widget.userName,
                                      userSurname: widget.userSurname);
                                },
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                          color: const Color.fromRGBO(29, 115, 137, 1),
                          iconSize: 30),
                    ),
                    const Text("New Product Adder",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: size.height * 0.045),
                    const Align(
                      alignment: Alignment(-0.80, 0),
                      child: Text("Name of the Product",
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
                              borderRadius: BorderRadius.circular(50),
                            ),
                            hintText: "The Joker Figure"),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    const Align(
                      alignment: Alignment(-0.80, 0),
                      child: Text("Price of the Product in Number",
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
                        keyboardType: TextInputType.emailAddress,
                        validator: (sValue) {
                          if (sValue == null || sValue.isEmpty) {
                            return 'Please enter a meaningful text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            hintText: "123"),
                      ),
                    ),
                    SizedBox(height: size.height * 0.015),
                    const Align(
                      alignment: Alignment(-0.80, 0),
                      child: Text("Image",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 15.5,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: size.height * 0.02,
                          right: size.height * 0.024,
                          bottom: size.height * 0.05,
                          top: size.height * 0.012,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Color.fromRGBO(29, 115, 137, 1),
                          ),
                          child: TextButton(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.017,
                                  horizontal: size.height * 0.18),
                              child: const Text(
                                'Add Image',
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
                    SizedBox(height: size.height * 0.15),
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
                                  horizontal: size.height * 0.145),
                              child: const Text(
                                'Add The Product',
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
                                    return ProfileLayout(
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
            ),
          ],
        ),
      ),
    );
    ;
  }
}
