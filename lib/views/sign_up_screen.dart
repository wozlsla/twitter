import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/main.dart';
import 'package:twitter/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/twitter.svg",
                width: Sizes.size32,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              Gaps.v80,
              Gaps.v80,
              Gaps.v10,
              Text(
                "See what's happening in the world right now.",
                style: GoogleFonts.inter(
                  fontSize: Sizes.size28 + Sizes.size3,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v80,
              Gaps.v80,
              Gaps.v2,
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
                    fontSize: Sizes.size16 + Sizes.size1,
                    color: Theme.of(context).twitterDarkGray,
                  ),
                  children: [
                    TextSpan(text: "By signing up, you agree to our "),
                    TextSpan(
                      text: "Terms",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(text: ", "),
                    TextSpan(
                      text: "Privacy Policy ",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(text: "and "),
                    TextSpan(
                      text: "Cookie Use",
                      style: TextStyle(color: Theme.of(context).primaryColor),
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
                fontSize: Sizes.size14 + Sizes.size1,
                color: Theme.of(context).twitterDarkGray,
              ),
            ),
            Gaps.h5,
            Text(
              "Log in",
              style: GoogleFonts.inter(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
