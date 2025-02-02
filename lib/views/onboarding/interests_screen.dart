import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/main.dart';
import 'package:twitter/views/onboarding/interests_detail_screen.dart';
import 'package:twitter/widgets/app_bar.dart';
import 'package:twitter/widgets/interest_button.dart';

final List<String> interests = [
  "Fashion & beauty",
  "Outdoors",
  "Arts & culture",
  "Animation\n& comics",
  "Business\n& finance",
  "Food",
  "Travel",
  "Entertainment",
  "Music",
  "Gaming",
  "Dance",
  "Animals",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();
  int _selectedCount = 0; // 선택된 항목의 개수

  void _updateSelectedButton(bool isSelected) {
    setState(() {
      _selectedCount += isSelected ? 1 : -1;
    });
  }

  void _onNextTap() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => InterestsDetailScreen(),
    ));
  }

  @override
  void initState() {
    _scrollController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
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
                  "What do you want to see on Twitter?",
                  style: GoogleFonts.inter(
                    fontSize: Sizes.size28 + Sizes.size1,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).twitterBlack,
                  ),
                ),
                Gaps.v24,
                Text(
                  "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                  style: GoogleFonts.inter(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).twitterDarkGray,
                  ),
                ),
                Gaps.v10,
                Divider(
                  color: Theme.of(context).twitterExtraLightGray, // 선 색상
                  thickness: 1, // 선 두께
                ),
                Gaps.v28,
                Wrap(
                  runSpacing: 10,
                  spacing: 6,
                  children: [
                    for (var interest in interests)
                      InterestButton(
                        interest: interest,
                        onSelected: _updateSelectedButton,
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _selectedCount >= 3
                  ? Text(
                      "Great work 🎉",
                      style: GoogleFonts.inter(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).twitterDarkGray,
                      ),
                    )
                  : Text(""),
              SizedBox(
                width: 100,
                child: CupertinoButton(
                  onPressed: _selectedCount >= 3 ? _onNextTap : null,
                  color: Theme.of(context).twitterBlack,
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
