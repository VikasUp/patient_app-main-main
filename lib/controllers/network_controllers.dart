import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  RxBool isOnline = true.obs;
  
  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateInternetConnectionStatus);
  }

  void _updateInternetConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      _showNoInternetSnackbar();
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }

  void _showNoInternetSnackbar() {
    Get.rawSnackbar(
      messageText: Text(
        'Please connect to the internet',
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
      isDismissible: false,
      duration: Duration(days: 1),
      backgroundColor: ColorManager.primarydarkGreenColor,
      icon: Icon(
        Icons.wifi_off,
        color: Colors.white,
        size: 35,
      ),
      margin: EdgeInsets.zero,
      snackStyle: SnackStyle.FLOATING,
    );
  }
}
