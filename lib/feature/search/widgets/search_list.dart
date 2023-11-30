import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insights_news/core/app_color.dart';
import 'package:insights_news/feature/news/data/news_model/article.dart';
import 'package:insights_news/feature/news/web_view.dart';

class SearchNewsListView extends StatelessWidget {
  const SearchNewsListView({
    super.key,
    required this.news,
  });
  final List<Article> news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            var data = news[index];
            return GestureDetector(
              onTap: () async {
                // Share.share('check out my website ${news.url}');
                // if (await canLaunchUrl(Uri.parse(news.url!))) {
                //   await launchUrl(
                //     Uri.parse(news.url!),
                //   );
                // } else {
                //   throw 'Could not launch ${news.url}';
                // }
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WebView(url: data.url!),
                ));
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: AppColor.containerBG,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        data.urlToImage ?? '',
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error);
                        },
                        width: 160,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontSize: 14),
                            ),
                            Text(
                              data.author ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(fontSize: 12),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/read.svg'),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text('Read',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                            color: AppColor.white,
                                            fontSize: 12))
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: news.length),
    );
  }
}
