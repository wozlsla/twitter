import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/widgets/app_bar.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';
import '../constants/theme/app_colors.dart';

import 'confirmation_code_screen.dart';
import 'customize_experience_screen.dart';
import 'sign_up_screen.dart';

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
        appBar: CustomAppBar(
          onLeadingTap: () => onSignUpTap(context), // context를 전달하여 실행
          leadingType: LeadingType.cancel,
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
                        color: TWColors.black,
                      ),
                    ),
                    Gaps.v24,
                    TextFormField(
                      style: TextStyle(
                        color: TWColors.blue,
                        fontSize: Sizes.size18,
                      ),
                      decoration: InputDecoration(
                        labelText: "Name",
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
                      ),
                      cursorColor: TWColors.blue,
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
                        color: TWColors.blue,
                        fontSize: Sizes.size18,
                      ),
                      decoration: InputDecoration(
                        labelText: "Phone number or email address",
                        labelStyle: TextStyle(color: TWColors.darkGray), // red?
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
                      ),
                      cursorColor: TWColors.blue,
                    ),
                    Gaps.v24,
                    TextFormField(
                      style: TextStyle(
                        color: TWColors.blue,
                        fontSize: Sizes.size18,
                      ),
                      decoration: InputDecoration(
                        labelText: "Date of birth",
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
                      ),
                      cursorColor: TWColors.blue,
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
                                color: TWColors.darkGray,
                              ),
                              children: [
                                const TextSpan(
                                  text: "By signing up, you agree to the ",
                                ),
                                TextSpan(
                                  text: "Terms of Service",
                                  style: TextStyle(
                                    color: TWColors.blue,
                                  ),
                                ),
                                const TextSpan(
                                  text: " and ",
                                ),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(
                                    color: TWColors.blue,
                                  ),
                                ),
                                const TextSpan(
                                  text: ", including ",
                                ),
                                TextSpan(
                                  text: "Cookie Use",
                                  style: TextStyle(
                                    color: TWColors.blue,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      ". Twitter\nmay use your contact information, including your\nemail address and phone number for purposes\noutlined in our Privacy Policy, like keeping your\naccount secure and personalizing our services,\nincluding ads. ",
                                ),
                                TextSpan(
                                  text: "Learn more",
                                  style: TextStyle(
                                    color: TWColors.blue,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      ". Others will be able to\nfind you by email or phone number, when provided,\nunless you choose otherwise. ",
                                ),
                                TextSpan(
                                  text: "here",
                                  style: TextStyle(
                                    color: TWColors.blue,
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
                                  color: TWColors.blue,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Sizes.size18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: _isFormValid()
                                      ? TWColors.black
                                      : TWColors.lightGray,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text("Next",
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: Sizes.size18,
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
