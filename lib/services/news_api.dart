import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_flutter_course/consts/api_consts.dart';
import 'package:news_flutter_course/models/news_models.dart';

class NewsApiServices {
  static Future<List<NewsModel>> getAllNews(
      {required int page, required String sortBy}) async {
    // var url = Uri.parse(
    //     "https://newsapi.org/v2/everything?q=Apple&pageSize=5&apiKey=28feb06972f34747acf9ebca8ea755d2");

    try {
      var uri = Uri.https(BASEURL, "v2/everything", {
        "q": "Apple",
        "pageSize": "5",
        "domains": "bbc.co.uk,techcrunch.com,engadget.com",
        "page": page.toString(),
        "sortBy": sortBy
        // "apiKey": API_KEY
      });
      var response = await http.get(uri, headers: {"X-Api-key": API_KEY});
      print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');
      Map data = jsonDecode(response.body);
      List newsTempList = [];
      if (data['code'] != null) {
        // throw data['message'];
        throw HttpException(data['code']);
      }
      for (var v in data["articles"]) {
        newsTempList.add(v);
        // log(v.toString());
        // print(v.toString());
        print(data["articles"].length.toString());
      }
      return NewsModel.newFromSnapshot(newsTempList);
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<List<NewsModel>> getTopHeadline() async {
    // var url = Uri.parse(
    //     "https://newsapi.org/v2/everything?q=Apple&pageSize=5&apiKey=28feb06972f34747acf9ebca8ea755d2");

    try {
      var uri = Uri.https(BASEURL, "v2/top-headlines", {"country": "us"});
      var response = await http.get(uri, headers: {"X-Api-key": API_KEY});
      print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');
      Map data = jsonDecode(response.body);
      List newsTempList = [];
      if (data['code'] != null) {
        // throw data['message'];
        throw HttpException(data['code']);
      }
      for (var v in data["articles"]) {
        newsTempList.add(v);
        // log(v.toString());
        // print(v.toString());
        print(data["articles"].length.toString());
      }
      return NewsModel.newFromSnapshot(newsTempList);
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<List<NewsModel>> searchNews({required String query}) async {
    try {
      var uri = Uri.https(BASEURL, "v2/everything", {
        "q": query,
        "pageSize": "10",
        "domains": "techcrunch.com",
      });
      var response = await http.get(uri, headers: {"X-Api-key": API_KEY});
      print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');
      Map data = jsonDecode(response.body);
      List newsTempList = [];
      if (data['code'] != null) {
        // throw data['message'];
        throw HttpException(data['code']);
      }
      for (var v in data["articles"]) {
        newsTempList.add(v);
        // log(v.toString());
        // print(v.toString());
        print(data["articles"].length.toString());
      }
      return NewsModel.newFromSnapshot(newsTempList);
    } catch (error) {
      throw error.toString();
    }
  }
}
