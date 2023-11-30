part of 'news_cubit.dart';

class NewsState {}

class NewsInitial extends NewsState {}

// news _ home
class NewsLoadingState extends NewsState {}

class NewsSuccessState extends NewsState {
  final NewsModel model;

  NewsSuccessState({required this.model});
}

class NewsErrorState extends NewsState {
  final String error;

  NewsErrorState({required this.error});
}

// news _ search
class SearchLoadingState extends NewsState {}

class SearchSuccessState extends NewsState {
  final NewsModel model;

  SearchSuccessState({required this.model});
}

class SearchErrorState extends NewsState {
  final String error;

  SearchErrorState({required this.error});
}

// source _ search
class SourceLoadingState extends NewsState {}

class SourceSuccessState extends NewsState {
  final NewsModel model;

  SourceSuccessState({required this.model});
}

class SourceErrorState extends NewsState {
  final String error;

  SourceErrorState({required this.error});
}
