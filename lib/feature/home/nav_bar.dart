import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights_news/core/app_color.dart';
import 'package:insights_news/feature/news/presentation/view/news_view.dart';
import 'package:insights_news/feature/profile/profile_view.dart';
import 'package:insights_news/feature/search/search_view.dart';
import 'package:insights_news/feature/source/source_view.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  List<Widget> screens = [
    const NewsView(),
    const SearchView(),
    const SourceView(),
    const ProfileView()
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/home.svg',
                colorFilter:
                    ColorFilter.mode(AppColor.lemonada, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset('assets/home.svg'),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/search.svg',
                colorFilter:
                    ColorFilter.mode(AppColor.lemonada, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset('assets/search.svg'),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/notification.svg',
                colorFilter:
                    ColorFilter.mode(AppColor.lemonada, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset('assets/notification.svg'),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/profile.svg',
                colorFilter:
                    ColorFilter.mode(AppColor.lemonada, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset('assets/profile.svg'),
              label: ''),
        ],
      ),
    );
  }
}
