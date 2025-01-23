import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/main.dart';
import 'package:twitter/views/create_account_screen.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final SvgPicture? icon;
  final bool isDark;

  const AuthButton({
    super.key,
    required this.text,
    this.icon,
    this.isDark = false,
  });

  void onAccountTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CreateAccountScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDark ? () => onAccountTap(context) : () {},
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size44 + Sizes.size2,
            vertical: Sizes.size16,
          ),
          decoration: BoxDecoration(
            color: isDark ? Theme.of(context).twitterBlack : Colors.white,
            border: Border.all(
              color: Theme.of(context).twitterExtraLightGray,
              width: Sizes.size2,
            ),
            borderRadius: BorderRadius.circular(
              Sizes.size36,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (icon != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: icon!, // icon이 null이 아닐 때만 추가
                ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: Sizes.size16 + Sizes.size2,
                  fontWeight: FontWeight.w800,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
