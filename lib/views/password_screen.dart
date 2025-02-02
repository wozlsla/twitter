import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';
import '../constants/theme/app_colors.dart';

import '../widgets/app_bar.dart';
import 'onboarding/interests_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = "";
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 7;
  }

  void _toggleObsecureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _onNextTap() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => InterestsScreen(),
    ));
  }

  void _onScaffold() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffold,
      child: Scaffold(
        appBar: CustomAppBar(
          leadingType: LeadingType.none,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v24,
              Text(
                "You'll need a password",
                style: GoogleFonts.inter(
                  fontSize: Sizes.size28 + Sizes.size1,
                  fontWeight: FontWeight.w800,
                  color: TWColors.black,
                ),
              ),
              Gaps.v24,
              TextField(
                controller: _passwordController,
                obscureText: _obscureText,
                cursorColor: TWColors.blue,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: TWColors.darkGray),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: TWColors.extraLightGray,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: TWColors.lightGray,
                    ),
                  ),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _toggleObsecureText,
                        child: SvgPicture.asset(
                          _obscureText
                              ? "assets/icons/eye.svg"
                              : "assets/icons/eye-off.svg",
                          width: Sizes.size24,
                          colorFilter: ColorFilter.mode(
                            TWColors.lightGray,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      Gaps.h5,
                      _isPasswordValid()
                          ? SvgPicture.asset(
                              "assets/icons/check-circle.svg",
                              width: Sizes.size24,
                              colorFilter: ColorFilter.mode(
                                Color(0xff53B882),
                                BlendMode.srcIn,
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
              Gaps.v24,
              _isPasswordValid()
                  ? GestureDetector(
                      onTap: _onNextTap,
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Sizes.size14,
                          ),
                          decoration: BoxDecoration(
                            color: TWColors.black,
                            borderRadius: BorderRadius.circular(28),
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
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
