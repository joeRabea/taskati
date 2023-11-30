import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insights_news/core/app_color.dart';
import 'package:insights_news/feature/news/presentation/view_model/cubit/news_cubit.dart';
import 'package:insights_news/feature/news/web_view.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
    required this.category,
  });
  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsCubit()..getNews(category),
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsSuccessState) {
              var data = state.model.articles;
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var news = data[index];
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
                            builder: (context) => WebView(url: news.url!),
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
                                  news.urlToImage ?? '',
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        news.title ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(fontSize: 14),
                                      ),
                                      Text(
                                        news.author ?? '',
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
                    itemCount: data!.length),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
