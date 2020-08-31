import 'package:apptracker/pages/first_page.dart';
import 'package:apptracker/pages/secound_page.dart';
import 'package:apptracker/pages/third_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Widget child;
    switch (_index) {
      case 0:
        child = FlutterLogo();
        break;
      case 1:
        child = MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FirstPage(),
        );
        break;
      case 2:
        child = MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SecoundPage(),
        );
        break;
      case 3:
        child = MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ThirdPage(),
        );
        break;
    }

    return Scaffold(
      body: SizedBox.expand(child: child),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) => setState(() => _index = newIndex),
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.blueAccent,
                size: 30.0,
              ),
              title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.access_alarm,
                color: Colors.blueAccent,
                size: 30.0,
              ),
              title: Text("Register")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.format_align_center,
                color: Colors.blueAccent,
                size: 30.0,
              ),
              title: Text("Shopping")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.blueAccent,
                size: 30.0,
              ),
              title: Text("Shopping")),
        ],
      ),
    );
  }
}
