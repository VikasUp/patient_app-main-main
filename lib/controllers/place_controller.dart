import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:patient_app/interceptor_handler/exception_handler.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';

class PlaceController extends GetxController {
  final TextEditingController search_Controller = TextEditingController();
  final List<dynamic>? _placeList = <dynamic>[].obs;
  String? _sessionToken;
  
  @override
  void onInit() {
    super.onInit();
    search_Controller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (_sessionToken == null) {
      _sessionToken = Uuid().v4();
    }
    getSuggestion(search_Controller.text);
  }

  void getSuggestion(String input) async {
    String apiKey = 'AIzaSyDthgB7q34RmM6TUlHCxezd29jte6Rb0pQ';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$apiKey&sessiontoken=$_sessionToken';
    try {
      var response = await http.get(Uri.parse(request));
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      print('data');
      print(response.body.toString());
      if (response.statusCode == 200) {
        _placeList!
            .assignAll(jsonDecode(response.body.toString())['predictions']);
      } else {
        throw BaseExceptionHandler('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
