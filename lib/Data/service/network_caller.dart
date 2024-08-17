import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_1_api_data_fetch/Data/model/network_response.dart';

class NetworkCaller {
  
//get request
  static Future<NetworkResponse> getRequest(
    String url,
  ) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 ) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        // gotoLogin();
        Get.snackbar(
          'Error', // Title
          'Authentication failed', // Message
          snackPosition: SnackPosition.BOTTOM, // Position
          duration: Duration(seconds: 2), // Duration
          backgroundColor: Colors.blue, // Background color
          colorText: Colors.white, // Text color
          borderRadius: 10, // Border radius
        );
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar(
        'Error', // Title
        'Something went wrong', // Message
        snackPosition: SnackPosition.BOTTOM, // Position
        duration: Duration(seconds: 2), // Duration
        backgroundColor: Colors.red[300], // Background color
        colorText: Colors.white, // Text color
        borderRadius: 10, // Border radius
      );
    }
    return NetworkResponse(false, -1, null);
  }


}
