import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/photo_page.dart';
import 'screens/text_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey[800],
        accentColor: Colors.lightGreenAccent,
        scaffoldBackgroundColor: Colors.white70,
      ),
      title: 'Receipt Hacker',
      color: Colors.white,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/photo': (context) => PhotoPage(),
        '/textified': (context) => TextPage(),
      },
    );
  }
}
