import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news/core/api_services.dart';
import 'package:insights_news/feature/news/data/news_model/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  void getNews(String category) {
    emit(NewsLoadingState());
    try {
      ApiServices().getNews(category).then((value) {
        emit(NewsSuccessState(model: value!));
      });
    } catch (e) {
      emit(NewsErrorState(error: e.toString()));
    }
  }

  void getSearchNews(String q) {
    emit(SearchLoadingState());
    try {
      ApiServices().searchNews(q).then((value) {
        emit(SearchSuccessState(model: value!));
      });
    } catch (e) {
      emit(SearchErrorState(error: e.toString()));
    }
  }

  void getSourceNews(String source) {
    emit(SourceLoadingState());
    try {
      ApiServices().getSourceNews(source).then((value) {
        emit(SourceSuccessState(model: value!));
      });
    } catch (e) {
      emit(SourceErrorState(error: e.toString()));
    }
  }
}
