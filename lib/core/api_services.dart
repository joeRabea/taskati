import 'package:insights_news/core/dio_congi.dart';
import 'package:insights_news/feature/news/data/news_model/news_model.dart';

class ApiServices {
  final _dio = DioConfiguration().dio;
  Future<NewsModel?> getNews(String category) async {
    try {
      var res = await _dio.get('/v2/top-headlines', queryParameters: {
        'country': 'us',
        'category': category,
        'apikey': '125aac10045c4091a1fa77bc672ce782'
      });

      // var res = await Dio().get(
      //     'https://newsapi.org/v2/top-headlines?apiKey=125aac10045c4091a1fa77bc672ce782&country=us');
      if (res.statusCode == 200) {
        var model = NewsModel.fromJson(res.data);
        print(model.totalResults);
        return model;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
    return null;
  }

  Future<NewsModel?> searchNews(String query) async {
    try {
      var res = await _dio.get('/v2/top-headlines', queryParameters: {
        'country': 'us',
        'q': query,
        'apikey': '125aac10045c4091a1fa77bc672ce782'
      });

      // var res = await Dio().get(
      //     'https://newsapi.org/v2/top-headlines?apiKey=125aac10045c4091a1fa77bc672ce782&country=us');
      if (res.statusCode == 200) {
        var model = NewsModel.fromJson(res.data);
        print(model.totalResults);
        return model;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
    return null;
  }

  Future<NewsModel?> getSourceNews(String source) async {
    try {
      var res = await _dio.get('/v2/top-headlines', queryParameters: {
        'country': 'us',
        'source': source,
        'apikey': '125aac10045c4091a1fa77bc672ce782'
      });

      // var res = await Dio().get(
      //     'https://newsapi.org/v2/top-headlines?apiKey=125aac10045c4091a1fa77bc672ce782&country=us');
      if (res.statusCode == 200) {
        var model = NewsModel.fromJson(res.data);
        print(model.totalResults);
        return model;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
    return null;
  }
}
