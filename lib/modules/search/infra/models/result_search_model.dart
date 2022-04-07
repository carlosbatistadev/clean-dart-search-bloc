import 'dart:convert';

import 'package:search_app/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  // ignore: annotate_overrides, overridden_fields
  final String image;
  // ignore: annotate_overrides, overridden_fields
  final String title;
  // ignore: annotate_overrides, overridden_fields
  final String content;

  ResultSearchModel({
    this.image,
    this.title,
    this.content,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'image': image});
    result.addAll({'title': title});
    result.addAll({'content': content});

    return result;
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
