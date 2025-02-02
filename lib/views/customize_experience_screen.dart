import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/widgets/app_bar.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';
import '../constants/theme/app_colors.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  const CustomizeExperienceScreen({super.key});

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool agreed = false;

  void _onAccountTap() {
    Navigator.of(context).pop(agreed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onLeadingTap: _onAccountTap,
        leadingType: LeadingType.back,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v28,
                Text(
                  "Customize your experience",
                  style: GoogleFonts.inter(
                    fontSize: Sizes.size28 + Sizes.size1,
                    fontWeight: FontWeight.w800,
                    color: TWColors.black,
                  ),
                ),
                Gaps.v28,
                Text(
                  "Track where you see Twitter content across the web",
                  style: GoogleFonts.inter(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w800,
                    color: TWColors.black,
                  ),
                ),
                Gaps.v14,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                        style: GoogleFonts.inter(
                          fontSize: Sizes.size16 + Sizes.size1,
                          fontWeight: FontWeight.w500,
                          color: TWColors.black,
                        ),
                      ),
                    ),
                    Switch(
                      value: agreed,
                      onChanged: (bool value) {
                        setState(() {
                          agreed = value;
                        });
                      },
                      activeColor: Color(0xff16a349),
                    ),
                  ],
                ),
                Gaps.v32,
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: Sizes.size14 + Sizes.size1,
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
                      TextSpan(
                          text:
                              ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy."),
                      TextSpan(
                        text: " Learn more",
                        style: TextStyle(color: TWColors.blue),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
                Gaps.v96,
                Gaps.v96,
                Gaps.v96,
                GestureDetector(
                  onTap: _onAccountTap,
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: agreed ? TWColors.black : TWColors.lightGray,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Next",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
