import 'package:flutter/material.dart';
import 'package:handown/Models/shopping_model.dart';
import 'package:handown/Screens/Main/HomeLayout.dart';
import 'package:handown/Screens/Main/ProfileLayout.dart';
import 'package:handown/Screens/Main/SearchLayout.dart';
import 'package:provider/provider.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MaterialApp(
        home: HomeLayout(),
      ),
    ),
    const SearchLayout(),
    const ProfileLayout(),
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
    return Scaffold(
      /*appBar: AppBar(
        centerTitle: true,
        title: const Text('HandOwn'),
        backgroundColor: appBarColor,
      ),*/
      backgroundColor: backColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),*/
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
