import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/screen/home_screen.dart';
import 'package:flutter_netflix_clone/screen/like_screen.dart';
import 'package:flutter_netflix_clone/screen/more_screen.dart';
import 'package:flutter_netflix_clone/screen/search_screen.dart';
import 'package:flutter_netflix_clone/widget/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Widget controller = DefaultTabController(
    length: 4,
    child: Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScreen(),
          SearchScreen(),
          LikeScreen(),
          MoreScreen()
        ],
      ),
      bottomNavigationBar: Bottom(),
    ),
  );

  // firebase 초기화
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // async await
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Center(
                  child: Text("Firebase Error",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ))),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'MaxFlix',
              theme: ThemeData(
                  brightness: Brightness.dark,
                  primaryColor: Colors.black,
                  accentColor: Colors.white),
              home: controller,
            );
          }

          return Directionality(
            textDirection: TextDirection.ltr,
            child: LinearProgressIndicator(),
          );
        });
  }
}
