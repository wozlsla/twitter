import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/main.dart';
import 'package:twitter/views/password_screen.dart';
import 'package:twitter/widgets/app_bar.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({super.key});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  final List<String> _code = List.generate(6, (index) => "");
  bool _isButtonEnabled = false;

  void _isCodeValidate(int index, String value) {
    setState(() {
      _code[index] = value; // 입력값 업데이트

      // 모든 필드가 비어 있지 않은지 확인 (유효성 검사)
      _isButtonEnabled = _code.every((char) => char.isNotEmpty);
    });

    if (value.isNotEmpty && index < 5) {
      FocusScope.of(context).nextFocus();
    }
  }

  void _onNextTap() {
    // Next 버튼 동작
    // final enteredCode = _code.join();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PasswordScreen()),
    );
  }

  void _onScaffold() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffold,
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.only(
            left: Sizes.size40,
            right: Sizes.size40,
            bottom: Sizes.size16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v24,
              Text(
                "We sent you a code",
                style: GoogleFonts.inter(
                  fontSize: Sizes.size28 + Sizes.size1,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).twitterBlack,
                ),
              ),
              Gaps.v24,
              Text(
                "Enter it below to verify\njhon.mobbin@gmail.com.",
                style: GoogleFonts.inter(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).twitterDarkGray,
                ),
              ),
              Gaps.v32,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return _CodeField(
                    onChanged: (value) => _isCodeValidate(index, value),
                  );
                }),
              ),
              SizedBox(height: 20),
              _isButtonEnabled
                  ? Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        "assets/icons/check-circle.svg",
                        width: Sizes.size36,
                        colorFilter: ColorFilter.mode(
                          Color(0xff53B882),
                          BlendMode.srcIn,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 120,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Didn't recieve email?",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                CupertinoButton(
                  onPressed: _isButtonEnabled ? _onNextTap : null,
                  padding: EdgeInsets.symmetric(vertical: Sizes.size20),
                  color: Theme.of(context).twitterBlack,
                  borderRadius: BorderRadius.circular(Sizes.size28),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CodeField extends StatelessWidget {
  const _CodeField({
    super.key,
    required this.onChanged,
  });

  // 값 변경 시 호출될 콜백 함수
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.size40,
      child: TextField(
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: "",
          // border: OutlineInputBorder(),
        ),
        style: TextStyle(
          fontSize: Sizes.size28,
          fontWeight: FontWeight.w800,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
