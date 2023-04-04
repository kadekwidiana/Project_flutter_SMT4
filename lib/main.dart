import 'package:flutter/material.dart';
// import 'detail_page.dart';
// import 'home_page.dart';
import 'login_google_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginGooglePage(),
      theme:
          ThemeData(brightness: Brightness.light, primarySwatch: Colors.amber),
    );
  }
}
