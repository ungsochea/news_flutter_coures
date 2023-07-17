import 'package:flutter/material.dart';
import 'package:news_flutter_course/models/news_models.dart';
import 'package:news_flutter_course/services/news_api.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> newsList = [];

  List<NewsModel> get getNewsList {
    return newsList;
  }

  Future<List<NewsModel>> fetchAllNews(
      {required int pageIndex, required String sortBy}) async {
    newsList =
        await NewsApiServices.getAllNews(page: pageIndex, sortBy: sortBy);
    return newsList;
  }

  Future<List<NewsModel>> fetchTopHeadline() async {
    newsList = await NewsApiServices.getTopHeadline();
    return newsList;
  }

  NewsModel findbyDate({required String publishedAt}) {
    return newsList
        .firstWhere((newdModel) => newdModel.publishedAt == publishedAt);
  }
}
