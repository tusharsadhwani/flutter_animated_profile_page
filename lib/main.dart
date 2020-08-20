import 'package:flutter/material.dart';

import 'chat_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Animations Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color.fromRGBO(35, 48, 64, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(color: Color.fromRGBO(35, 48, 64, 1)),
        scaffoldBackgroundColor: Color.fromRGBO(28, 36, 47, 1),
      ),
      home: ChatPage(),
    );
  }
}
