import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/photo_page.dart';
import 'screens/text_page.dart';
import 'screens/results_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.lightGreen,
        scaffoldBackgroundColor: Colors.white,
      ),
      title: 'Receipt Hacker',
      color: Colors.white,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/photo': (context) => PhotoPage(),
        '/text': (context) => TextPage(),
        '/results': (context) => ResultsPage(),
      },
    );
  }
}
