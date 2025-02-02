import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/widgets/app_bar.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';
import '../constants/theme/app_colors.dart';

import '../widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leadingType: LeadingType.none),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 160,
              ),
              Text(
                "See what's happening in the world right now.",
                style: GoogleFonts.inter(
                  fontSize: Sizes.size28 + Sizes.size3,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 140,
              ),
              AuthButton(
                  icon: SvgPicture.asset(
                    "assets/icons/google.svg",
                    width: Sizes.size20 + Sizes.size3,
                  ),
                  text: "Continue with Google"),
              Gaps.v16,
              AuthButton(
                  icon: SvgPicture.asset(
                    "assets/icons/apple.svg",
                    width: Sizes.size20 + Sizes.size3,
                  ),
                  text: "Continue with Apple"),
              Gaps.v28,
              AuthButton(
                isDark: true,
                text: "Create account",
              ),
              Gaps.v32,
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: Sizes.size18,
                    color: TWColors.darkGray,
                  ),
                  children: [
                    TextSpan(text: "By signing up, you agree to our "),
                    TextSpan(
                      text: "Terms",
                      style: TextStyle(color: TWColors.blue),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(text: ", "),
                    TextSpan(
                      text: "Privacy Policy ",
                      style: TextStyle(color: TWColors.blue),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(text: "and "),
                    TextSpan(
                      text: "Cookie Use",
                      style: TextStyle(color: TWColors.blue),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(text: "."),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gaps.h40,
            Text(
              "Have an account already?",
              style: GoogleFonts.inter(
                fontSize: Sizes.size16,
                color: TWColors.darkGray,
              ),
            ),
            Gaps.h5,
            Text(
              "Log in",
              style: GoogleFonts.inter(
                color: TWColors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
