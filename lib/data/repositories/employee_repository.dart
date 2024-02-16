import 'dart:io';

import 'package:mobile_assessment/common/io/data.dart';
import 'package:mobile_assessment/utils/helpers.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';

class EmployeeRepository extends GetxService {
  Map<String, dynamic> getAllEmployees() {
    return Api.successResponse;
  }
}
