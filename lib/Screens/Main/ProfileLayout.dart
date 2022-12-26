import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'EditProfileLayout.dart';
import 'SellProfileLayout.dart';

class ProfileLayout extends StatefulWidget {
  ProfileLayout(
      {Key? key,
      required this.userEmail,
      required this.userName,
      required this.userSurname})
      : super(key: key);
  final String userEmail;
  final String userName;
  final String userSurname;

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const Color appBarColor = Color(0xff252525);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 90.0, right: 90.0, bottom: 20, top: 60.0),
            child: Image.asset('assets/images/pngegg.png'),
          ),
          Text(
            widget.userName + " " + widget.userSurname,
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSerif(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.userEmail,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: size.height * 0.155),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.005,
                    horizontal: size.height * 0.037),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color.fromRGBO(29, 115, 137, 1),
                ),
                child: TextButton(
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return EditProfileLayout(
                              userEmail: widget.userEmail,
                              userName: widget.userName,
                              userSurname: widget.userSurname);
                        },
                      ),
                    ),
                  },
                ),
              ),
              SizedBox(
                width: size.height * 0.015,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.005,
                    horizontal: size.height * 0.057),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.red,
                ),
                child: TextButton(
                  child: const Text(
                    'Log out',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Warning'),
                      content: const Text('Do you really want to log out'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'No'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Yes'),
                          child: const Text('Yes, I am sure'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.005, horizontal: size.height * 0.090),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: appBarColor,
            ),
            child: TextButton(
              child: const Text(
                'Products On The Market',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SellProfileLayout(
                          userEmail: widget.userEmail,
                          userName: widget.userName,
                          userSurname: widget.userSurname);
                    },
                  ),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
