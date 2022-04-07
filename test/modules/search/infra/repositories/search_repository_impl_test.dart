import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_app/modules/search/domain/errors/errors.dart';
import 'package:search_app/modules/search/infra/datasources/search_datasource.dart';
import 'package:search_app/modules/search/infra/models/result_search_model.dart';
import 'package:search_app/modules/search/infra/repositories/search_repository_impl.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

void main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepositoryImpl(datasource);

  test("Deve retornar uma lista de ResultSearchModel", () async {
    when(datasource.search(any)).thenAnswer((_) async => <ResultSearchModel>[]);

    final result = await repository.search("Carlos");
    expect(result | null, isA<List<ResultSearchModel>>());
  });

  test("Deve retornar um DatasourceError caso o datasource falhe", () async {
    when(datasource.search(any)).thenThrow(Exception());

    final result = await repository.search("Carlos");
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
