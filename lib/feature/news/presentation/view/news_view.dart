import 'package:flutter/material.dart';
import 'package:insights_news/feature/news/presentation/view/widgets/custom_tab.dart';
import 'package:insights_news/feature/news/presentation/view/widgets/news_header.dart';
import 'package:insights_news/feature/news/presentation/view/widgets/news_list_view.dart';
import 'package:insights_news/feature/news/presentation/view/widgets/news_slider.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                NewsHeaderWidget(),
                SizedBox(
                  height: 20,
                ),
                NewsSliderWidget(),
                SizedBox(
                  height: 20,
                ),
                CustomTapWidget(),
                Expanded(
                    child: TabBarView(children: [
                  NewsListView(category: 'science'),
                  NewsListView(category: 'sports'),
                  NewsListView(category: 'technology'),
                  NewsListView(category: 'business'),
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
