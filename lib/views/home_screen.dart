import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/theme/app_colors.dart';

import 'sign_up_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void onScreenTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SignUpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onScreenTap(context),
      child: Scaffold(
        backgroundColor: TWColors.blue,
        body: Center(
          child: SvgPicture.asset(
            "assets/icons/twitter.svg",
            width: 80,
            colorFilter: ColorFilter.mode(
              Colors.white, // 원하는 색상
              BlendMode.srcIn, // 색상을 적용하는 방식
            ),
          ),
        ),
      ),
    );
  }
}
