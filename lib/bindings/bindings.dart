import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:patient_app/controllers/list_controller.dart';
import 'package:patient_app/controllers/network_controllers.dart';
import 'package:patient_app/controllers/place_controller.dart';

class ControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());
    Get.lazyPut<PlaceController>(() => PlaceController());
    Get.lazyPut<ListController>(() => ListController());
  }
}
