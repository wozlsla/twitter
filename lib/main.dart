import 'package:flutter/material.dart';
import 'package:twitter/views/sign_up_screen.dart';

void main() {
  runApp(const TwitterApp());
}

class TwitterApp extends StatelessWidget {
  const TwitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Clone',
      theme: ThemeData(
        primaryColor: Color(0xff1DA1F2),
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
      ),
      home: SignUpScreen(),
    );
  }
}
