import 'package:dartz/dartz.dart';
import 'package:search_app/modules/search/domain/entities/result_search.dart';
import 'package:search_app/modules/search/domain/repositories/search_repository.dart';

import '../errors/errors.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository _repository;
  const SearchByTextImpl(this._repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
    String searchText,
  ) {
    if (searchText == null || searchText.isEmpty) {
      return Future.value(Left(InvalidTextError()));
    }

    return _repository.search(searchText);
  }
}
