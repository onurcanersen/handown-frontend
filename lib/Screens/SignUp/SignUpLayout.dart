import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../Login/LoginLayout.dart';
import '../Main/Main.dart';
import '../Welcome/welcome_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController fullNameController = TextEditingController();


class SignUpLayout extends StatefulWidget {
  const SignUpLayout({Key? key}) : super(key: key);

  @override
  State<SignUpLayout> createState() => _SignUpLayoutState();
}

class _SignUpLayoutState extends State<SignUpLayout> {
  static final formGlobalKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(children: [
          Form(
            key: formGlobalKey2,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.025),
                Align(
                  alignment: Alignment(-0.8, -0.2),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return WelcomeScreen();
                            },
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: Color.fromRGBO(29, 115, 137, 1),
                      iconSize: 30),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: size.width * 0.4,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(29, 115, 137, 1),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/noun-trolley.svg", //"asset/images/royal1.jpg"
                      height: size.width * 0.3,
                      width: size.width * 0.3,
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.035),
                Text("Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold)),
                SizedBox(height: size.height * 0.035),
                Align(
                  alignment: Alignment(-0.80, 0),
                  child: Text("E-mail",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 15.5,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: size.height * 0.015),
                SizedBox(
                  height: size.height * 0.1,
                  width: size.width * 0.8,
                  child: TextFormField(
                    controller: emailController,
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
                        hintText: "abc@itu.edu.tr"),
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                Align(
                  alignment: Alignment(-0.80, 0),
                  child: Text("Password",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 15.5,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: size.height * 0.015),
                SizedBox(
                    height: size.height * 0.1,
                    width: size.width * 0.8,
                    child: PasswordField()),
                SizedBox(height: size.height * 0.015),
                Align(
                  alignment: Alignment(-0.80, 0),
                  child: Text("Full Name",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 15.5,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: size.height * 0.015),
                SizedBox(
                  height: size.height * 0.1,
                  width: size.width * 0.8,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: fullNameController,
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
                        hintText: "ITU Student"),
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: size.height * 0.075,
                      width: size.width * 0.8,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color.fromRGBO(29, 115, 137, 1))),
                    ),
                    SizedBox(
                      height: size.height * 0.075,
                      width: size.width * 0.8,
                      child: TextButton(
                          onPressed: () async {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (formGlobalKey2.currentState!.validate()) {
                              var splittedName = fullNameController.text.split(' ');
                              var name = splittedName[0];
                              var surname = splittedName[1];
                              final response = await http.post(
                                  Uri.parse(
                                      'https://us-central1-handown.cloudfunctions.net/users/signup'),
                                  headers: <String, String>{
                                    'Content-Type':
                                        'application/json; charset=UTF-8',
                                  },
                                  body: jsonEncode(<String, String>{
                                      "email": emailController.text,
                                      "name": name,
                                      "surname": surname,
                                      "password": passwordController.text,
                                      "type": "SELLER"
                                  }),
                                );
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Main(userEmail: emailController.text, userName: name, userSurname: surname);
                                  },
                                ),
                              );
                            }
                          },
                          child: Text("Sign Up",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal))),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015),
                Align(
                  alignment: Alignment(-0.7, 0),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                        TextSpan(text: "Already have an account?\n"),
                        TextSpan(
                            text: 'Login',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginLayout();
                                    },
                                  ),
                                );
                              })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obsecurePassword = true;
  void ToggleObsecure() {
    setState(() {
      obsecurePassword = !obsecurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: passwordController,
        obscureText: obsecurePassword,
        validator: (sValue) {
          if (sValue == null || sValue.isEmpty) {
            return 'Please enter a meaningful text';
          } else if (sValue.length < 2) {
            return 'Password is shorter than 8 characters.';
          }
          return null;
        },
        //(val) => val!.length < 8 ? 'Password too short.' : null,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            hintText: "********",
            suffixIcon: IconButton(
                onPressed: ToggleObsecure,
                icon: Icon(obsecurePassword
                    ? Icons.visibility_off
                    : Icons.visibility))));
  }
}
