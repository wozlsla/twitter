import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/sizes.dart';
import '../constants/theme/app_colors.dart';

class InterestButton extends StatefulWidget {
  final String interest;
  final ValueChanged<bool> onSelected; // 선택 상태 변경 시 호출되는 콜백

  const InterestButton({
    super.key,
    required this.interest,
    required this.onSelected,
  });

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
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
        width: 177, // 고정된 너비
        height: 90,
        padding: EdgeInsets.symmetric(
          vertical: Sizes.size8,
          horizontal: Sizes.size12,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? TWColors.blue : Colors.white,
          borderRadius: BorderRadius.circular(Sizes.size14),
          border: Border.all(
            color: TWColors.extraLightGray,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            widget.interest,
            style: GoogleFonts.inter(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.bold,
              color: _isSelected ? Colors.white : TWColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
