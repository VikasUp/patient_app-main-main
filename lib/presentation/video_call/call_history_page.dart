import 'package:flutter/material.dart';
import 'package:patient_app/data/constmanager/constants.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call History'),
      ),
      body: CallHistoryList(),
    );
  }
}

class CallHistoryList extends StatefulWidget {
  @override
  _CallHistoryListState createState() => _CallHistoryListState();
}

class _CallHistoryListState extends State<CallHistoryList> {
  List<String> callHistory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call History'),
      ),
      body: ListView.builder(
        itemCount: callHistory.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(callHistory[index]),
          );
        },
      ),
    );
  }

  void addCallToHistory(String callDetails) {
    setState(() {
      callHistory.add(callDetails);
    });
  }
}
