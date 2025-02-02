import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/sizes.dart';
import '../constants/theme/app_colors.dart';

enum LeadingType {
  cancel,
  back,
  none;
}

extension LeadingTypeExtension on LeadingType {
  Widget intoWidget(BuildContext context, {VoidCallback? onTap}) {
    final Map<LeadingType, Widget Function(BuildContext)> leadingWidgets = {
      LeadingType.cancel: (context) => GestureDetector(
            onTap: onTap,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Cancel",
                style: GoogleFonts.inter(
                  color: TWColors.black,
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
      LeadingType.back: (context) => GestureDetector(
            onTap: onTap, // 기본 동작 없음, onTap이 있을 때만 실행
            child: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.arrow_back,
                  color: TWColors.black,
                  size: Sizes.size28,
                ),
              ),
            ),
          ),
      LeadingType.none: (context) => const SizedBox.shrink(), // 그대로 유지
    };
    return leadingWidgets[this]!(context);
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final LeadingType leadingType;
  final VoidCallback? onLeadingTap;

  const CustomAppBar({
    super.key,
    required this.leadingType,
    this.onLeadingTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: Sizes.size96,
      leading: Padding(
        padding: const EdgeInsets.only(left: Sizes.size20),
        child: leadingType.intoWidget(context, onTap: onLeadingTap),
      ),
      title: SvgPicture.asset(
        "assets/icons/twitter.svg",
        width: Sizes.size32,
        colorFilter: ColorFilter.mode(
          TWColors.blue,
          BlendMode.srcIn,
        ),
      ),
      backgroundColor: Colors.white,
      // backgroundColor: Colors.transparent, // 위에 시간, 배터리 등 사라짐
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
