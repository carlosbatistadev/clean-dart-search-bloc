import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:search_app/app_bindings.dart';
import 'package:search_app/modules/search/domain/usecases/search_by_text.dart';
import 'package:search_app/modules/search/search_bindings.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    AppBindings().dependencies();
    SearchBindings().dependencies();
  });

  test("Deve retornar o usecase sem erro", () {
    final usecase = Get.find<SearchByText>();
    expect(usecase, isA<SearchByText>());
  });
}
