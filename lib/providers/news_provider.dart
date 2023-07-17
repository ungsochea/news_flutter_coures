import 'package:flutter/material.dart';
import 'package:news_flutter_course/models/news_models.dart';
import 'package:news_flutter_course/services/news_api.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> newList = [];

  List<NewsModel> get getNewsList {
    return newList;
  }

  Future<List<NewsModel>> fetchAllNews({required int pageIndex}) async {
    newList = await NewsApiServices.getAllNews(page: pageIndex);
    return newList;
  }
}
