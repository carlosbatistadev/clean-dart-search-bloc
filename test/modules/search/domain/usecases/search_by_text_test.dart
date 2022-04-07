import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_app/modules/search/domain/entities/result_search.dart';
import 'package:search_app/modules/search/domain/errors/errors.dart';
import 'package:search_app/modules/search/domain/repositories/search_repository.dart';
import 'package:search_app/modules/search/domain/usecases/search_by_text.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository);

  test('Deve retornar uma lista de ResultSearch', () async {
    when(repository.search(any)).thenAnswer((_) async {
      return const Right(<ResultSearch>[]);
    });

    final result = await usecase.search('carlos');
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('Deve retornar uma InvalidTextError caso o texto seja inválido',
      () async {
    when(repository.search(any)).thenAnswer((_) async {
      return const Right(<ResultSearch>[]);
    });

    var result = await usecase.search(null);
    expect(result.fold(id, id), isA<InvalidTextError>());

     result = await usecase.search("");
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
