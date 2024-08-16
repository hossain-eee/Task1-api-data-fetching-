import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_1_api_data_fetch/Data/model/network_response.dart';

class NetworkCaller {
//get request
  static Future<NetworkResponse> getRequest(String url,) async {
    try {
     http. Response response = await http.get(Uri.parse(url));
      // headers: {'token': AuthController.accessToken.toString()});

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 &&
          jsonDecode(response.body)['status'] == 'OK') {
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

/* //post method
  static Future<NetworkResponse> postRequest (String url,Map<String,dynamic>body,{bool isLogin=false})async{
  try{
    Response response = await post(
      Uri.parse(url),
    headers: {
        'content-type':'Application/json',
      'token':AuthController.accessToken.toString()
    },
      body: jsonEncode(body),
    );
    log(response.statusCode.toString());
    log(response.body);
    if(response.statusCode==200 && jsonDecode(response.body)['msg']=='success'){
      return NetworkResponse(
          true,
          response.statusCode,
          jsonDecode(response.body
          ));
    }else if(response.statusCode==401){
      if(isLogin==false){
        gotoLogin();
      }
    }else {
      return NetworkResponse(false, response.statusCode, null);
    }
  }catch(e){
    log(e.toString());
  }
  return NetworkResponse(false, -1, null);
  }

  static Future<void> gotoLogin() async {
  await AuthController.clear();
  Navigator.pushAndRemoveUntil(
      CraftyBay.globalKey.currentContext!,
      MaterialPageRoute(builder: (context) => const EmailVerificationScreen()),
          (route) => false);

} */
//Another getRequest for invoiceList, because invoiceList don't have msg body like ['msg']=='success', so to avoid security risk create another getRequest
/*   static Future<NetworkResponse> getRequestInVoice(String url,{bool isLogin=false}) async{
    try{
      Response response = await get(Uri.parse(url),
          headers: {'token': AuthController.accessToken.toString()});

      log(response.statusCode.toString());
      log(response.body);
      if(response.statusCode==200 ){
        return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
      }else if(response.statusCode==401){
        if(!isLogin){

          gotoLogin();
        }

      }else{
        return NetworkResponse(false, response.statusCode, null);
      }
    }catch(e){
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  } */
}
