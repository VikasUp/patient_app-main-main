import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:patient_app/data/constmanager/constants.dart';
import 'package:patient_app/interceptor_handler/exception_handler.dart';
import 'package:patient_app/model/department_model.dart';
import 'package:patient_app/services/api_client.dart';

class ListController extends GetxController {
  var isLoading = true.obs;
  DepartmentModel? departmentModel;
  var departmentdata = 0.obs;
  final exceptionHandler = ExceptionHandler();
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getUsers() async {
    String userUrl = "${ApiClient.baseUrl}${Constants.endpoint}";
    try {
      final dio = Dio();
      final response = await dio.get(userUrl);
      departmentModel = departmentFromJson(json.encode(response.data));
      print(departmentModel?.data);
      departmentdata(departmentModel?.data?.length);
      print(departmentModel?.data?.length);
      if (response.statusCode == 200) {
        isLoading.value = false;
        update();
      } else {}
      print('Response Body: ${response.data}');
    } on DioError catch (e) {
      final handledException = exceptionHandler.handleDioError(e);
      Get.snackbar('Error', handledException.toString());
      isLoading.value = false;
    } catch (e) {
      print('Exception: $e');
      Get.snackbar('Error', e.toString());
      isLoading.value = false;
    }
  }
}
