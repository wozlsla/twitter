import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/main.dart';
import 'package:twitter/views/customize_experience_screen.dart';
import 'package:twitter/views/sign_up_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  void onSignUpTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignUpScreen(),
    ));
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CustomizeExperienceScreen(),
      ),
    );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: Sizes.size96,
          leading: Padding(
            padding: const EdgeInsets.only(left: Sizes.size20),
            child: GestureDetector(
              onTap: () => onSignUpTap(context),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cancle",
                  style: GoogleFonts.inter(
                    color: Theme.of(context).twitterBlack,
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
          title: SvgPicture.asset(
            "assets/icons/twitter.svg",
            width: Sizes.size32,
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v28,
                  Text(
                    "Create your account",
                    style: GoogleFonts.inter(
                      fontSize: Sizes.size28 + Sizes.size1,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).twitterBlack,
                    ),
                  ),
                  Gaps.v24,
                  TextFormField(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size16 + Sizes.size2,
                    ),
                    decoration: InputDecoration(
                      labelText: "Name",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).twitterExtraLightGray,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).twitterLightGray,
                        ),
                      ),
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                  ),
                  Gaps.v24,
                  TextFormField(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size16 + Sizes.size2,
                    ),
                    decoration: InputDecoration(
                      labelText: "Phone number or email address",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).twitterExtraLightGray,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).twitterLightGray,
                        ),
                      ),
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                  ),
                  Gaps.v24,
                  TextFormField(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size16 + Sizes.size2,
                    ),
                    decoration: InputDecoration(
                      labelText: "Date of birth",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).twitterExtraLightGray,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).twitterLightGray,
                        ),
                      ),
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: _onNextTap,
                        child: Container(
                          width: Sizes.size96,
                          height: 47,
                          decoration: BoxDecoration(
                            color: Theme.of(context).twitterLightGray,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text("Next",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: Sizes.size16 + Sizes.size2,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gaps.v28,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
