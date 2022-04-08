import 'package:get/get.dart';
import 'package:search_app/modules/search/domain/repositories/search_repository.dart';
import 'package:search_app/modules/search/domain/usecases/search_by_text.dart';
import 'package:search_app/modules/search/external/datasources/github_datasource.dart';
import 'package:search_app/modules/search/infra/datasources/search_datasource.dart';
import 'package:search_app/modules/search/infra/repositories/search_repository_impl.dart';

class SearchBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<SearchDatasource>(GithubDatasource(Get.find()));
    Get.put<SearchRepository>(SearchRepositoryImpl(Get.find()));
    Get.put<SearchByText>(SearchByTextImpl(Get.find()));
  }
}
