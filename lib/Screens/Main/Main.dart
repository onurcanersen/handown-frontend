import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handown/Models/shopping_model.dart';
import 'package:handown/Screens/Main/CartLayout.dart';
import 'package:handown/Screens/Main/HomeLayout.dart';
import 'package:handown/Screens/Main/ProfileLayout.dart';
import 'package:handown/Screens/Main/SearchLayout.dart';
import 'package:provider/provider.dart';

class Main extends StatelessWidget {
  Main(
      {super.key,
      required this.userEmail,
      required this.userName,
      required this.userSurname});

  static const String _title = 'Flutter Code Sample';

  final String userEmail;
  final String userName;
  final String userSurname;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(
          userEmail: userEmail, userName: userName, userSurname: userSurname),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget(
      {super.key,
      required this.userEmail,
      required this.userName,
      required this.userSurname});

  final String userEmail;
  final String userName;
  final String userSurname;

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late final List<Widget> _widgetOptions = <Widget>[
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartModel(),
          child: const MaterialApp(
            home: HomeLayout(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CartModel(),
          child: const MaterialApp(
            home: SearchLayout(),
          ),
        ),
      ],
    ),
    //CartLayout(),
    ProfileLayout(
        userEmail: widget.userEmail,
        userName: widget.userName,
        userSurname: widget.userSurname),
    //CartLayout(), Çalışmıyor bu ya üzüyo beni
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color backColor = Color(0xffefefef);
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            /*
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),*/
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (context) {
                return SafeArea(
                  child: CupertinoPageScaffold(
                    child: ChangeNotifierProvider(
                      create: (context) => CartModel(),
                      child: const MaterialApp(
                        home: HomeLayout(),
                      ),
                    ),
                  ),
                );
              });
            case 1:
              return CupertinoTabView(builder: (context) {
                return SafeArea(
                  child: CupertinoPageScaffold(
                    child: ChangeNotifierProvider(
                      create: (context) => CartModel(),
                      child: const MaterialApp(
                        home: SearchLayout(),
                      ),
                    ),
                  ),
                );
              }); /*
            case 2:
              return CupertinoTabView(builder: (context) {
                return SafeArea(
                  child: CupertinoPageScaffold(
                    child: ChangeNotifierProvider(
                      create: (context) => CartModel(),
                      child: const MaterialApp(
                        home: CartLayout(),
                      ),
                    ),
                  ),
                );
              });*/
            case 2:
              return CupertinoTabView(builder: (context) {
                return SafeArea(
                  child: CupertinoPageScaffold(
                    child: ProfileLayout(
                        userEmail: widget.userEmail,
                        userName: widget.userName,
                        userSurname: widget.userSurname),
                  ),
                );
              });
            default:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: HomeLayout(),
                );
              });
          }
        });
  }
}
