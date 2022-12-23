import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handown/Screens/Login/LoginLayout.dart';
import 'package:handown/Screens/SignUp/SignUpLayout.dart';

class WelcomeLayout extends StatelessWidget {
  final Widget child;
  const WelcomeLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height,
        width: double.infinity,
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),

                children: <TextSpan>[
                  TextSpan(text: 'Welcome to\n'),
                  TextSpan(
                      text: 'HandOwn',
                      style: TextStyle(color: Color.fromRGBO(29, 115, 137, 1)))
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: size.width * 0.4,
                  width: size.width * 0.4,
                  decoration: const BoxDecoration(
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
            SizedBox(
              height: size.height * 0.075,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginLayout();
                      },
                    ),
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: size.height * 0.075,
                      width: size.width * 0.8,
                      child: const DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color.fromRGBO(29, 115, 137, 1))),
                    ),
                    const Text("Login",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.normal))
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignUpLayout();
                      },
                    ),
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.075,
                      width: size.width * 0.8,
                      child: const DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color.fromRGBO(29, 115, 137, 1))),
                    ),
                    const Text("Sign Up",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.normal))
                  ],
                ))
          ])
        ]));
  }
}
/*Text(
            "Welcome to\n\n",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "HandOwn",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
          ),
          Positioned(
            bottom: size.height *0.5,
            left: 0,
            child: Image.asset("assets/images/royal1.jpg"),
            width: size.width * 0.2,
          ),
          TextButton(
            //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            onPressed: () {},
            child: Text("LOGIN"),
          ),
          TextButton(
            //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            onPressed: () {},
            child: Text("Sign Up"),
          )*/

/*
 SvgPicture.asset(
              "assets/icons/noun-trolley.svg", //"asset/images/royal1.jpg"
              height: size.height * 0.05,
              width: size.width * 0.05,
                      ),
          
           */
