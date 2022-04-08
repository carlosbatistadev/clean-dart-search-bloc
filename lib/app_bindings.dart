import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
  }
}
