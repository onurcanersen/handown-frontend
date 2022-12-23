import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:handown/Screens/SignUp/SignUpLayout.dart';
import 'package:handown/Screens/Welcome/welcome_screen.dart';
import 'package:handown/Screens/Main/Main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();

class LoginLayout extends StatefulWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  static final formGlobalKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Form(
              key: formGlobalKey1,
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
                  Text("Login",
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
                              if (formGlobalKey1.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                final response = await http.post(
                                  Uri.parse(
                                      'https://us-central1-handown.cloudfunctions.net/users/login'),
                                  headers: <String, String>{
                                    'Content-Type':
                                        'application/json; charset=UTF-8',
                                  },
                                  body: jsonEncode(<String, String>{
                                    "email": emailController.text,
                                    "password": passwordController.text
                                  }),
                                );
                                if (response.statusCode == 200) {
                                  final decodedResponse = jsonDecode(response.body);
                                  print(decodedResponse);
                                  print(decodedResponse[0]["email"]);
                                  
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Main(userEmail: decodedResponse[0]["email"], userName: decodedResponse[0]["name"], userSurname: decodedResponse[0]["surname"]);
                                      },
                                    ),
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        elevation: 16,
                                        child: Container(
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: <Widget>[
                                              SizedBox(height: 20),
                                              Center(
                                                  child: Text(
                                                      'Invalid email or password')),
                                              SizedBox(height: 20),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              }
                            },
                            child: Text("Login",
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
                          TextSpan(text: "Don't have an account?\n"),
                          TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return SignUpLayout();
                                      },
                                    ),
                                  );
                                }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
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
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: obsecurePassword,
        //validator: (val) => (val!.length< 8 || val.isEmpty) ? 'Please enter a meaningful text' : null,
        validator: (sValue) {
          if (sValue == null || sValue.isEmpty) {
            return 'Please enter a meaningful text';
          } else if (sValue.length < 2) {
            return 'Password is shorter than 8 characters.';
          }
          return null;
        },
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

/*
TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),

                children: <TextSpan>[
                  TextSpan(text: 'Welcome to\n'),
                  TextSpan(
                      text: 'Handown',
                      style: TextStyle(color: Color.fromRGBO(29, 115, 137, 1)))
 */

/*extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        //elevation: -1,
        leading: IconButton(
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
            iconSize: 30)

      ),*/
