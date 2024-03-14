import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_app/bindings/bindings.dart';
import 'package:patient_app/controllers/network_controllers.dart';
import 'package:patient_app/injection_container.dart';
import 'package:patient_app/utils/router_helper.dart';

void main() async {
  runApp(MyApp());
  InjectionContainer.init();
}

class MyApp extends StatelessWidget {
  final NetworkController connectivityController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
