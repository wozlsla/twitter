import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/main.dart';
import 'package:twitter/views/onboarding/interests_screen.dart';
import 'package:twitter/widgets/app_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
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
                color: Theme.of(context).twitterBlack,
              ),
            ),
            Gaps.v24,
            TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                labelText: "Password",
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
                          Theme.of(context).twitterLightGray,
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
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).twitterBlack,
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
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
