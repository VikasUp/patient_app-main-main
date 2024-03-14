import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:patient_app/data/constmanager/constants.dart';
import 'package:patient_app/interceptor_handler/exception_handler.dart';
import 'package:patient_app/model/department_model.dart';

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
    String userUrl = "${Constants.baseUrl}${Constants.endpoint}";
    try {
      final dio = Dio();
      final response = await dio.get(userUrl);
      print('=====');
      print(response.data);
      print(json);
      print(response.statusCode);
      print('=====');
      departmentModel = departmentFromJson(json.encode(response.data));
      print(departmentModel?.data);
      print('departmentModel?.data');
      departmentdata(departmentModel?.data?.length);
      print('---');
      print(departmentModel?.data?.length);
      if (response.statusCode == 200) {
        isLoading.value = false;
        update();
      } else {}
      print('Response Body: ${response.data}');
    } on DioError catch (e) {
      print('Dio Error: $e');
      final handledException = exceptionHandler.handleDioError(e); // Handle Dio errors using your custom handler
      Get.snackbar('Error', handledException.toString());
      isLoading.value = false;
    } catch (e) {
      print('Exception: $e');
      Get.snackbar('Error', e.toString());
      isLoading.value = false;
    }
  }
}
