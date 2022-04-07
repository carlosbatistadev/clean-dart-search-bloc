import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:search_app/modules/search/domain/errors/errors.dart';
import 'package:search_app/modules/search/infra/datasources/search_datasource.dart';
import 'package:search_app/modules/search/infra/models/result_search_model.dart';

class GithubDatasource implements SearchDatasource {
  final Dio _dio;
  const GithubDatasource(this._dio);

  @override
  Future<List<ResultSearchModel>> search(String searchText) async {
    final _uri = Uri.parse("https://api.github.com/search/users?q=$searchText");
    final _response = await _dio.get(_uri.toString());

    if (_response.statusCode == 200) {
      final _data = _response.data["items"] as List;

      return List<ResultSearchModel>.from(_data.map((i) {
        return ResultSearchModel.fromMap(i);
      }));
    } else {
      throw DatasourceError();
    }
  }
}
