import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:insights_news/core/app_color.dart';

class CustomTapWidget extends StatefulWidget {
  const CustomTapWidget({super.key});

  @override
  State<CustomTapWidget> createState() => _CustomTapWidgetState();
}

class _CustomTapWidgetState extends State<CustomTapWidget> {
  final int _tapIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ButtonsTabBar(
        unselectedBackgroundColor: AppColor.containerBG,
        backgroundColor: AppColor.lemonada,
        // buttonMargin: const EdgeInsets.symmetric(horizontal: 5),
        // labelSpacing: 15,

        unselectedLabelStyle: TextStyle(color: AppColor.white),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        labelStyle:
            TextStyle(color: AppColor.scaffoldBG, fontWeight: FontWeight.bold),
        tabs: const [
          Tab(
            text: 'Science',
          ),
          Tab(
            text: 'Sports',
          ),
          Tab(text: 'Technology'),
          Tab(
            text: 'Business',
          ),
        ]);
  }
}
