import 'dart:math';


import 'package:get/get.dart';

import '../../utils/helpers.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token = "";
  late String appbaseurl;
  late Map<String, String> _mainHeader;


  ApiClient({required String appbaseurl}) {
    baseUrl = appbaseurl;

    timeout = const Duration(seconds: 30);
    _mainHeader = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }

// POST METHOD
  Future<Response> getRequest({
    required String url,
  }) async {
    try {
      Response response;
      // The below request is the same as above.

      response = await get(url);

      if (response.body == null) {
        showSnackBar(title: "Error",
            message: "Kindly check your internet connection",
            type: "error");
      }

      // if(response.status.code == 401){
      //   Get.offAll(const LandingScreen());
      // }

      logItem("_________________________________________++++++++++++++++++++");
      logItem(response.body);

      print(response.body.toString());
      return response;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

// POST METHOD
  Future<Response> postRequest(
      {required String url, required Map<dynamic, dynamic> data}) async {
    try {
      Response response;
      // The below request is the same as above.
      print("--------------------------------------");


      print(data);
      response = await post(url, data, headers: _mainHeader);


      if (response.body == null) {
        showSnackBar(title: "Error",
            message: "Kindly check your internet connection",
            type: "error");
      }


      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
      print(response.body.toString());
      return response;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }
}

// // GET METHOD
// Future<Response> getRequest({
//   required String uri,
// }) async {
//   try {
//     Response response = await get(uri);
//     return response;
//   } catch (e) {
//     print(e.toString());
//     return Response(statusCode: 1, statusText: e.toString());
//   }
// }
