import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legalkan/ui/pages/user_main_pages/pages/activity_page.dart';
import 'package:legalkan/ui/pages/user_main_pages/pages/home_page.dart';
import 'package:legalkan/ui/pages/user_main_pages/pages/notifications_page.dart';
import 'package:legalkan/ui/pages/user_main_pages/pages/profile_page.dart';
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
    ActivityPage(),
    NotificationsPage(),
    ProfilePage(),
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
            icon: SvgPicture.asset("assets/icons/home.svg"),
            activeIcon: SvgPicture.asset("assets/icons/home_active.svg"),
            label: "Beranda"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/activity.svg"),
              activeIcon: SvgPicture.asset("assets/icons/activity_active.svg"),
              label: "Kegiatan"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/notif.svg"),
              activeIcon: SvgPicture.asset("assets/icons/notif_active.svg"),
              label: "Notifikasi"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/profile.svg"),
              activeIcon: SvgPicture.asset("assets/icons/profile_active.svg"),
              label: "Profile"
          )
        ],
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        selectedLabelStyle: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelStyle: myTextTheme.bodySmall,
        currentIndex: _currentPageIndex,
        selectedItemColor: blue,
        unselectedItemColor: blue.withOpacity(0.7),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        iconSize: 24,
      ),
    );
  }
}
