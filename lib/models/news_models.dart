import 'package:news_flutter_course/services/global_methods.dart';
import 'package:reading_time/reading_time.dart';

class NewsModel {
  String newsId,
      sourceName,
      authorName,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      dateToshow,
      content,
      readingTimeText;

  NewsModel(
      {required this.newsId,
      required this.sourceName,
      required this.authorName,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.dateToshow,
      required this.content,
      required this.readingTimeText});

  factory NewsModel.fromJson(dynamic json) {
    String title = json["title"] ?? "";
    String description = json["description"] ?? "";
    String content = json["content"] ?? "";
    String dateToShow = "";
    if (json["publishedAt"] != null) {
      dateToShow = GlobalMethods.formettedDateText(json["publishedAt"]);
    }
    return NewsModel(
        newsId: json["source"]["id"] ?? "",
        sourceName: json["source"]["name"] ?? "",
        authorName: json["author"] ?? "",
        title: title,
        description: description,
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"] ??
            "https://i.guim.co.uk/img/media/cd6efbd1bade44704b0b4f1d7a2b72e3a635a823/0_247_5568_3341/master/5568.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=1dc4191028d3f1147475a2ea0acc8d6a",
        publishedAt: json["publishedAt"] ?? "",
        dateToshow: dateToShow,
        content: content,
        readingTimeText: readingTime(title + description + content).msg);
  }

  static List<NewsModel> newFromSnapshot(List newSnapshot) {
    return newSnapshot.map((json) {
      return NewsModel.fromJson(json);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['newsId'] = newsId;
    data['sourceName'] = sourceName;
    data['authorName'] = authorName;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['dateToshow'] = dateToshow;
    data['content'] = content;
    data['readingTimeText'] = readingTimeText;
    return data;
  }
}

// class NewsModel {
//   String? status;
//   int? totalResults;
//   List<Articles>? articles;

//   NewsModel({this.status, this.totalResults, this.articles});

//   NewsModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     totalResults = json['totalResults'];
//     if (json['articles'] != null) {
//       articles = <Articles>[];
//       json['articles'].forEach((v) {
//         articles!.add(new Articles.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['totalResults'] = this.totalResults;
//     if (this.articles != null) {
//       data['articles'] = this.articles!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Articles {
//   Source? source;
//   String? author;
//   String? title;
//   String? description;
//   String? url;
//   String? urlToImage;
//   String? publishedAt;
//   String? content;

//   Articles(
//       {this.source,
//       this.author,
//       this.title,
//       this.description,
//       this.url,
//       this.urlToImage,
//       this.publishedAt,
//       this.content});

//   Articles.fromJson(Map<String, dynamic> json) {
//     source =
//         json['source'] != null ? new Source.fromJson(json['source']) : null;
//     author = json['author'];
//     title = json['title'];
//     description = json['description'];
//     url = json['url'];
//     urlToImage = json['urlToImage'];
//     publishedAt = json['publishedAt'];
//     content = json['content'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.source != null) {
//       data['source'] = this.source!.toJson();
//     }
//     data['author'] = this.author;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['url'] = this.url;
//     data['urlToImage'] = this.urlToImage;
//     data['publishedAt'] = this.publishedAt;
//     data['content'] = this.content;
//     return data;
//   }
// }

// class Source {
//   String? id;
//   String? name;

//   Source({this.id, this.name});

//   Source.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }
