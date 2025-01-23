import 'package:flutter/material.dart';
import 'package:twitter/views/home_screen.dart';

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
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color(0xff1DA1F2),
        // primaryColor: Color(0xff4A9BEB),
        appBarTheme: AppBarTheme(
          // color: Colors.transparent, // 위에 시간, 배터리 등 사라짐
          color: Colors.white,
          elevation: 0,
        ),
      ),
      home: HomeScreen(),
    );
  }
}

extension TwitterColors on ThemeData {
  // Secondary Colors
  Color get twitterBlack => const Color(0xFF14171A);
  Color get twitterDarkGray => const Color(0xFF657786);
  Color get twitterLightGray => const Color(0xFFAAB8C2);
  Color get twitterExtraLightGray => const Color(0xFFE1E8ED);
  Color get twitterExtraExtraLightGray => const Color(0xFFF5F8FA);
}
