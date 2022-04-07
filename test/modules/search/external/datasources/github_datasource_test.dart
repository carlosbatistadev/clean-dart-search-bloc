import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_app/modules/search/domain/errors/errors.dart';
import 'package:search_app/modules/search/external/datasources/github_datasource.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = GithubDatasource(dio);

  test("Deve retornar uma lista de ResultSearchModel", () async {
    when(dio.get(any)).thenAnswer((_) async {
      return Response(data: jsonDecode(githubResult), statusCode: 200);
    });

    final future = datasource.search("Carlos");
    expect(future, completes);
  });

  test("Deve retornar um DatasourceError se o código não for 200", () async {
    when(dio.get(any)).thenAnswer((_) async {
      return Response(data: null, statusCode: 401);
    });

    final future = datasource.search("Carlos");
    expect(future, throwsA(isA<DatasourceError>()));
  });

  test("Deve retornar um Exception se tiver no Dio", () async {
    when(dio.get(any)).thenThrow(Exception());

    final future = datasource.search("Carlos");
    expect(future, throwsA(isA<Exception>()));
  });
}
