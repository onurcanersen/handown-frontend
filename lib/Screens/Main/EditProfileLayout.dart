import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:handown/Screens/Main/Main.dart';
import 'package:handown/Screens/Main/ProfileLayout.dart';

class EditProfileLayout extends StatefulWidget {
  EditProfileLayout(
      {Key? key,
      required this.userEmail,
      required this.userName,
      required this.userSurname})
      : super(key: key);

  final String userEmail;
  final String userName;
  final String userSurname;

  @override
  State<EditProfileLayout> createState() => _EditProfileLayoutState();
}

class _EditProfileLayoutState extends State<EditProfileLayout> {
  static final formGlobalKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Form(
              key: formGlobalKey3,
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
                    const Text("Edit Profile",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: size.height * 0.015),
                    ImageProfile(),
                    SizedBox(height: size.height * 0.015),
                    const Align(
                      alignment: Alignment(-0.80, 0),
                      child: Text("Change Address",
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
                            hintText: "ITU Vadi Dormitories"),
                      ),
                    ),
                    SizedBox(height: size.height * 0.015),
                    const Align(
                      alignment: Alignment(-0.80, 0),
                      child: Text("Change E-mail",
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
                            hintText: "abc@itu.edu.tr"),
                      ),
                    ),
                    SizedBox(height: size.height * 0.015),
                    const Align(
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
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        child: const PasswordField()),
                    SizedBox(height: size.height * 0.015),
                    Stack(
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
                        SizedBox(
                          height: size.height * 0.075,
                          width: size.width * 0.8,
                          child: TextButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (formGlobalKey3.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
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
                                }
                              },
                              child: const Text("Edit",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ImageProfile() {
    return Stack(
      children: const <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: AssetImage('assets/images/pngegg.png'),
        ),
        Positioned(
          bottom: 15,
          right: 15,
          child: Icon(
            Icons.camera_alt_rounded,
            color: Colors.black,
            size: 30.0,
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      width: size.width,
      margin: EdgeInsets.all(size.width * 0.1),
      child: Column(
        children: <Widget>[
          const Text(
            'Select Profile Picture',
            style: TextStyle(
                fontSize: 15.5,
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            children: <Widget>[
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt_rounded),
                label: const Text('Camera'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.image),
                label: const Text('Images'),
              )
            ],
          ),
        ],
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
        obscureText: obsecurePassword,
        //validator: (val) => (val!.length< 8 || val.isEmpty) ? 'Please enter a meaningful text' : null,
        validator: (sValue) {
          if (sValue == null || sValue.isEmpty) {
            return 'Please enter a meaningful text';
          } else if (sValue.length < 8) {
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
