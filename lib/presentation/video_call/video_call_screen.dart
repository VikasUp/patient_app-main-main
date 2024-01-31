import 'package:flutter/material.dart';
import 'package:patient_app/data/constmanager/constants.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'call_history_page.dart'; // Import the CallHistoryPage

class VideoCallPage extends StatelessWidget {
  final String callID;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  VideoCallPage({super.key, required this.callID});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: ZegoUIKitPrebuiltCall(
        appID: Constants.appId,
        appSign: Constants.appSign,
        userID: 'user_id',
        userName: 'user_name',
        callID: callID,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
      ),
    );
  }

  void navigateToCallHistory() {
    navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => CallHistoryPage()),
    );
  }
}
