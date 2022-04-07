import 'package:search_app/modules/search/infra/models/result_search_model.dart';

abstract class SearchDatasource {

  Future<List<ResultSearchModel>> search(String searchText);
}