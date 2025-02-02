import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/main.dart';
import 'package:twitter/widgets/app_bar.dart';
import 'package:twitter/widgets/interest_detail_button.dart';

const interests = {
  // Map<String, <List<List<String>>>
  "Music": [
    ["Pop", "K-pop", "R&B", "J-pop", "OST"],
    ["Hiphop", "House", "Tango", "Rock", "indie"],
    ["Opera", "Jazz", "Country", "Symphony", "New Age", "Classic"]
  ],
  "Entertainment": [
    ["Anime", "Disney", "Ghibli", "Manga", "Web Novels"],
    ["Movies", "Netflix", "Disney", "Korean Dramas", "Marvel"],
    ["Game", "Mobile", "Board Games", "E-Sports", "PlayStation", "Nintendo"]
  ],
  "Travel": [
    ["Asia", "Japan", "South Korea", "Thailand", "China"],
    ["Europe", "Italy", "France", "Germany", "Spain"],
    ["Americas", "USA", "Canada", "Mexico", "Brazil"],
  ],
};

class InterestsDetailScreen extends StatefulWidget {
  const InterestsDetailScreen({
    super.key,
  });

  @override
  State<InterestsDetailScreen> createState() => _InterestsDetailScreenState();
}

class _InterestsDetailScreenState extends State<InterestsDetailScreen> {
  int _selectedCount = 0; // 선택된 항목의 개수

  void _updateSelectedButton(bool isSelected) {
    setState(() {
      _selectedCount += isSelected ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: Sizes.size20),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size40,
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
              Gaps.v20,
              Text(
                "Interests are used to personalize your experience and will be visible on your profile.",
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
              Gaps.v10,
              ...interests.entries.map(
                (entry) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Key 출력 (e.g., "Music", "Entertainment")
                      Text(
                        entry.key,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).twitterBlack,
                          fontSize: Sizes.size16 + Sizes.size4,
                        ),
                      ),
                      Gaps.v24,

                      // Value 출력 (Wrap으로 리스트 출력) // Each line with horizontal scroll
                      ...entry.value.map((line) {
                        return Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: Sizes.size3),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: line.map((interest) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: Sizes.size10),
                                  child: InterestDetailButton(
                                    interest: interest,
                                    onSelected: _updateSelectedButton,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      }),
                      Gaps.v20,
                      Divider(
                        color: Theme.of(context).twitterExtraLightGray, // 선 색상
                        thickness: 1, // 선 두께
                      ),
                      Gaps.v10,
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(right: Sizes.size20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 100,
                child: CupertinoButton(
                  onPressed: _selectedCount >= 3 ? () {} : null,
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
