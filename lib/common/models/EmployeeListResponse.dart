import 'dart:convert';

import 'package:mobile_assessment/common/models/employee.dart';
EmployeeListResponse employeeListResponseFromJson(String str) => EmployeeListResponse.fromJson(json.decode(str));
String employeeListResponseToJson(EmployeeListResponse data) => json.encode(data.toJson());
class EmployeeListResponse {
  EmployeeListResponse({
      num? statusCode, 
      String? message, 
      dynamic errors, 
      List<Data>? data,}){
    _statusCode = statusCode;
    _message = message;
    _errors = errors;
    _data = data;
}

  EmployeeListResponse.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _errors = json['errors'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _statusCode;
  String? _message;
  dynamic _errors;
  List<Data>? _data;
EmployeeListResponse copyWith({  num? statusCode,
  String? message,
  dynamic errors,
  List<Data>? data,
}) => EmployeeListResponse(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  errors: errors ?? _errors,
  data: data ?? _data,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  dynamic get errors => _errors;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    map['errors'] = _errors;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data extends Employee {
  Data({
      int? id,
      String? firstName, 
      String? lastName, 
      String? designation, 
      int? level,
      double? productivityScore,
      String? currentSalary, 
      int? employmentStatus,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _designation = designation;
    _level = level;
    _productivityScore = productivityScore;
    _currentSalary = currentSalary;
    _employmentStatus = employmentStatus;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _designation = json['designation'];
    _level = json['level'];
    _productivityScore = json['productivity_score'];
    _currentSalary = json['current_salary'];
    _employmentStatus = json['employment_status'];
  }
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _designation;
  int? _level;
  double? _productivityScore;
  String? _currentSalary;
  int? _employmentStatus;
Data copyWith({  int? id,
  String? firstName,
  String? lastName,
  String? designation,
  int? level,
  double? productivityScore,
  String? currentSalary,
  int? employmentStatus,
}) => Data(  id: id ?? _id,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  designation: designation ?? _designation,
  level: level ?? _level,
  productivityScore: productivityScore ?? _productivityScore,
  currentSalary: currentSalary ?? _currentSalary,
  employmentStatus: employmentStatus ?? _employmentStatus,
);
  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get designation => _designation;
  int? get level => _level;
  double? get productivityScore => _productivityScore;
  String? get currentSalary => _currentSalary;
  int? get employmentStatus => _employmentStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['designation'] = _designation;
    map['level'] = _level;
    map['productivity_score'] = _productivityScore;
    map['current_salary'] = _currentSalary;
    map['employment_status'] = _employmentStatus;
    return map;
  }

}