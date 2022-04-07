import 'package:dartz/dartz.dart';
import 'package:search_app/modules/search/domain/entities/result_search.dart';
import 'package:search_app/modules/search/domain/errors/errors.dart';
import 'package:search_app/modules/search/infra/datasources/search_datasource.dart';

import '../../domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource _datasource;
  const SearchRepositoryImpl(this._datasource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
    String searchText,
  ) async {
    try {
      final _result = await _datasource.search(searchText);
      return Right(_result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
