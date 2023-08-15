import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legalkan/ui/pages/user_main_pages/pages/legal_assistant_page.dart';
import 'package:legalkan/ui/pages/user_main_pages/pages/legal_recommendation_page.dart';
import 'package:legalkan/ui/pages/user_main_pages/pages/home_page.dart';
import 'package:legalkan/ui/pages/user_main_pages/pages/legal_review_page.dart';
import 'package:legalkan/ui/pages/user_main_pages/pages/legal_consultant_page.dart';
import '../../../common/styles.dart';

class UserMainPage extends StatefulWidget {

  static const routeName = "/user-main-page";

  const UserMainPage({Key? key}) : super(key: key);

  @override
  State<UserMainPage> createState() => _UserMainPageState();
}

class _UserMainPageState extends State<UserMainPage> {

  final _pages = const [
    HomePage(),
    LegalRecommendationPage(),
    LegalReviewPage(),
    LegalConsultantPage(),
    LegalAssistantPage(),
  ];

  var _currentPageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: SvgPicture.asset("assets/icons/home.svg"),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: SvgPicture.asset("assets/icons/home_active.svg"),
            ),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset("assets/icons/activity.svg"),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset("assets/icons/activity_active.svg"),
              ),
              label: "Rekomendasi",
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 6, top: 2),
                child: SvgPicture.asset("assets/icons/review.svg"),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 6, top: 2),
                child: SvgPicture.asset("assets/icons/review_active.svg"),
              ),
              label: "Review"
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset("assets/icons/work.svg"),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset("assets/icons/work_active.svg"),
              ),
              label: "E-lawyer"
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset("assets/icons/chat.svg"),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset("assets/icons/chat_active.svg"),
              ),
              label: "Assistant"
          )
        ],
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        selectedLabelStyle: myTextTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 11),
        unselectedLabelStyle: myTextTheme.bodySmall?.copyWith(fontSize: 11),
        currentIndex: _currentPageIndex,
        selectedItemColor: blue,
        unselectedItemColor: blue.withOpacity(0.6),
        backgroundColor: Colors.white,
        iconSize: 22,
      ),
    );
  }
}
