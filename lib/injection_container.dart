import 'package:get/get.dart';
import 'package:patient_app/controllers/network_controllers.dart';

class InjectionContainer {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
