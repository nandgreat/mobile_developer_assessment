import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'package:mobile_assessment/common/models/EmployeeListResponse.dart';
import 'package:mobile_assessment/common/models/employee.dart';
import 'package:mobile_assessment/data/repositories/employee_repository.dart';
import 'package:mobile_assessment/utils/helpers.dart';

class HomeController extends GetxController {
  final EmployeeRepository _employeeRepository = EmployeeRepository();

  RxList<Employee> employees = RxList([]);
  RxList<Employee> filteredEmployees = RxList([]);

  RxBool isLoading = false.obs;
  var box;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      logItem("we are here oooo");
      box = await Hive.openBox('employee_box'); // open box

      await getEmployees();
    });
  }

  Future<void> getEmployees() async {
    isLoading.value = true;

    var hiveEmployees = await getEmployeesFromHive();

    logItem("My Hive empl");
    logItem(hiveEmployees);

    if (hiveEmployees!.isNotEmpty) {
      hiveEmployees.forEach((element) {
        employees.add(Employee(
            currentSalary: element.currentSalary,
            designation: element.designation,
            employmentStatus: element.employmentStatus,
            firstName: element.firstName,
            id: element.id,
            lastName: element.lastName,
            level: element.level,
            productivityScore: element.productivityScore));
      });
    } else {
      employees.value = await getEmployeesFromResponse();
    }

    filteredEmployees.value = employees;

    isLoading.value = false;
  }

  Future<List<dynamic>?> getEmployeesFromHive() async {
    var myList;

    await Hive.openBox('employee_box');

    try {
      logItem("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      myList = await box.get('employees', defaultValue: []);
    } catch (error) {
      logItem("###############################################");
      logItem(error);
    }

    var newlist = [];
    if (myList != null) {
      newlist = myList;

      logItem("ˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆ");
      logItem(newlist);
    }

    return newlist;
  }

  Future<List<Employee>> getEmployeesFromResponse() async {
    await Future.delayed(Duration(seconds: 2));
    logItem("This is another one oooo");

    var response =
        EmployeeListResponse.fromJson(_employeeRepository.getAllEmployees());

    logItem("zzzzzzzzzzzzz");
    logItem(response.runtimeType);

    List<Employee> courses = response.data!;

    box.put('employees', courses);

    return courses;
  }

  void handleSearch(String? searchText) async {
    if (searchText!.isEmpty) {
      filteredEmployees.value = employees;
      return;
    }

    List<Employee> courses = employees.where((map) {
      return filterEmployees(map, searchText);
    }).toList();
    // List<Employee> courses = [];
    // for (var element in employees) {
    //   if (element.firstName!.contains(searchText)) {
    //     courses.add(element);
    //   }
    // }

    filteredEmployees.value = courses;
  }
}
