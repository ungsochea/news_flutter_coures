import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_flutter_course/consts/api_consts.dart';
import 'package:news_flutter_course/models/bookmarks_models.dart';
import 'package:http/http.dart' as http;
import 'package:news_flutter_course/models/news_models.dart';

class BookmarksProvider with ChangeNotifier {
  List<BookmarksModel> bookmatksList = [];

  List<BookmarksModel> get getBookmatksList {
    return bookmatksList;
  }

  Future<void> addToBookmark({required NewsModel newsModel}) async {
    try {
      var uri = Uri.https(BASEURL_FIREBASE, "bookmarks.json");
      var response = await http.post(
        uri,
        body: json.encode(
            // {"Test": "Anytest"},
            newsModel.toJson()),
      );
      print('Response status: ${response.statusCode}');
      print('Response status: ${response.body}');
    } catch (error) {
      rethrow;
    }
  }
}
