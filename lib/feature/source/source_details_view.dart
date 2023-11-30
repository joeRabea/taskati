import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news/core/app_color.dart';
import 'package:insights_news/feature/news/presentation/view_model/cubit/news_cubit.dart';
import 'package:insights_news/feature/search/widgets/search_list.dart';

class SourceDetailsView extends StatelessWidget {
  const SourceDetailsView({super.key, required this.source});
  final String source;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsCubit()..getSourceNews(source),
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(source),
              ),
              body: state is SourceSuccessState
                  ? Padding(
                      padding: const EdgeInsets.all(15),
                      child: SearchNewsListView(news: state.model.articles!),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                      color: AppColor.lemonada,
                    )),
            );
          },
        ));
  }
}
