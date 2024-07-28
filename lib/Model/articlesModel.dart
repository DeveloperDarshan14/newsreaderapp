// To parse this JSON data, do
//
//     final articlesModel = articlesModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ArticlesModel articlesModelFromJson(String str) => ArticlesModel.fromJson(json.decode(str));

String articlesModelToJson(ArticlesModel data) => json.encode(data.toJson());

class ArticlesModel {
  String status;
  int totalResults;
  List<Article> articles;

  ArticlesModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"]?? "",
    title: json["title"]?? "",
    description: json["description"] ?? "",
    url: json["url"]??"",
    urlToImage: json["urlToImage"] ?? "",
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"]?? "",
  );

  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}

class Source {
  final Id? id;
  final String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: idValues.map[json["id"]],
    name: nameValues.map[json["name"]].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": idValues.reverse[id],
    "name": nameValues.reverse[name],
  };
}

enum Id {
  AXIOS,
  CNN,
  GOOGLE_NEWS
}

final idValues = EnumValues({
  "axios": Id.AXIOS,
  "cnn": Id.CNN,
  "google-news": Id.GOOGLE_NEWS
});

enum Name {
  AXIOS,
  CNN,
  GOOGLE_NEWS,
  KTLA_LOS_ANGELES
}

final nameValues = EnumValues({
  "Axios": Name.AXIOS,
  "CNN": Name.CNN,
  "Google News": Name.GOOGLE_NEWS,
  "KTLA Los Angeles": Name.KTLA_LOS_ANGELES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
