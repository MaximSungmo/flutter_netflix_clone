import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/screen/home_screen.dart';
import 'package:flutter_netflix_clone/screen/more_screen.dart';
import 'package:flutter_netflix_clone/widget/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaxFlix',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              Container(
                color: Colors.white60,
              ),
              Container(
                color: Colors.red,
              ),
              MoreScreen()
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
