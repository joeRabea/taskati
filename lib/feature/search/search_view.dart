import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insights_news/core/app_color.dart';
import 'package:insights_news/feature/news/presentation/view_model/cubit/news_cubit.dart';
import 'package:insights_news/feature/search/widgets/search_list.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Search For News'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      context.read<NewsCubit>().getSearchNews(value);
                    },
                    style: TextStyle(color: AppColor.lemonada),
                    decoration: InputDecoration(
                        hintText: 'Enter a keyword to search',
                        prefixIconConstraints:
                            const BoxConstraints(maxHeight: 60, maxWidth: 60),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 10),
                          child: SvgPicture.asset(
                            'assets/search.svg',
                            width: 22,
                            fit: BoxFit.contain,
                          ),
                        )),
                  ),
                  const SizedBox(height: 10),
                  Expanded(child: BlocBuilder<NewsCubit, NewsState>(
                    builder: (context, state) {
                      if (state is SearchSuccessState) {
                        print(state.model.totalResults);
                        return SearchNewsListView(news: state.model.articles!);
                      } else {
                        return Center(
                            child: CircularProgressIndicator(
                          color: AppColor.lemonada,
                        ));
                      }
                    },
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
