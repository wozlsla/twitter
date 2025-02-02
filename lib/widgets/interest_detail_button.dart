import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/main.dart';

class InterestDetailButton extends StatefulWidget {
  final String interest;
  final ValueChanged<bool> onSelected;

  const InterestDetailButton({
    super.key,
    required this.interest,
    required this.onSelected,
  });

  @override
  State<InterestDetailButton> createState() => _InterestDetailButtonState();
}

class _InterestDetailButtonState extends State<InterestDetailButton> {
  bool _isSelected = false;

  void onTap() {
    setState(() {
      _isSelected = !_isSelected;
      widget.onSelected(_isSelected); // 선택 상태 변경 전달
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size11,
          horizontal: Sizes.size24,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(Sizes.size24),
          border: Border.all(
            color: Theme.of(context).twitterExtraLightGray,
          ),
        ),
        child: Text(
          widget.interest,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: Sizes.size14 + Sizes.size2,
            fontWeight: FontWeight.w600,
            color: _isSelected ? Colors.white : Theme.of(context).twitterBlack,
          ),
        ),
      ),
    );
  }
}
