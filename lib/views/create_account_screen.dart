import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/main.dart';
import 'package:twitter/views/confirmation_code_screen.dart';
import 'package:twitter/views/customize_experience_screen.dart';
import 'package:twitter/views/sign_up_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  bool _agreed = false;

  void onSignUpTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignUpScreen(),
    ));
  }

  void _onNextTap() async {
    if (_isFormValid()) {
      final bool agreed = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CustomizeExperienceScreen(),
        ),
      );
      setState(() {
        _agreed = agreed;
      });
    }
  }

  void _onSignUpTap() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ConfirmationCodeScreen(),
      ),
    );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  String? _isEmailValid(String? value) {
    if (value == null) return null;

    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(value)) {
      return "Email Not Valid";
    }

    return null;
  }

  bool _isFormValid() => _formkey.currentState?.validate() ?? false;

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
              Form(
                key: _formkey,
                child: Column(
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
                      onChanged: (value) {
                        _isFormValid();
                        setState(() => _formData["email"] = value);
                      },
                      validator: _isEmailValid,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
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
              ),
              Column(
                children: [
                  _agreed
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: Sizes.size24),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: Sizes.size14 + Sizes.size1,
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).twitterDarkGray,
                              ),
                              children: [
                                const TextSpan(
                                  text: "By signing up, you agree to the ",
                                ),
                                TextSpan(
                                  text: "Terms of Service",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const TextSpan(
                                  text: " and ",
                                ),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const TextSpan(
                                  text: ", including ",
                                ),
                                TextSpan(
                                  text: "Cookie Use",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      ". Twitter\nmay use your contact information, including your\nemail address and phone number for purposes\noutlined in our Privacy Policy, like keeping your\naccount secure and personalizing our services,\nincluding ads. ",
                                ),
                                TextSpan(
                                  text: "Learn more",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      ". Others will be able to\nfind you by email or phone number, when provided,\nunless you choose otherwise. ",
                                ),
                                TextSpan(
                                  text: "here",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const TextSpan(text: "."),
                              ],
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  Align(
                    alignment:
                        _agreed ? Alignment.center : Alignment.centerRight,
                    child: FractionallySizedBox(
                      widthFactor: _agreed ? 1 : 0.3,
                      child: GestureDetector(
                        onTap: _agreed ? _onSignUpTap : _onNextTap,
                        child: _agreed
                            ? Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Sizes.size16 + Sizes.size2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: _isFormValid()
                                      ? Theme.of(context).twitterBlack
                                      : Theme.of(context).twitterLightGray,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text("Next",
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: Sizes.size16 + Sizes.size2,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                      ),
                    ),
                  ),
                  Gaps.v32,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
