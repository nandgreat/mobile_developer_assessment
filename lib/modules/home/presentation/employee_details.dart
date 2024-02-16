import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_assessment/common/models/employee.dart';
import 'package:mobile_assessment/controllers/HomeController.dart';
import 'package:mobile_assessment/utils/helpers.dart';
import 'package:mobile_assessment/widgets/LoadingWidget.dart';

import '../../../widgets/employee_details_item.dart';
import '../../../widgets/employee_list_item.dart';
import '../../widgets/inputs/app_textfield.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  int id;

  EmployeeDetailsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  final HomeController _homeController = Get.put(HomeController());

  Employee employee = Employee();

  @override
  void initState() {
    super.initState();

    logItem(widget.id);

    employee = _homeController.employees
        .firstWhere((element) => element.id == widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Details"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            EmployeeInfoWidgetItem(
                firstValue: "${employee.firstName!} ${employee.lastName!}",
                firstLabel: "Employee Name"),
            EmployeeInfoWidgetItem(
                firstValue: employee.designation!,
                firstLabel: "Designated"),
            Row(
              children: [
                Expanded(
                  child: EmployeeInfoWidgetItem(
                      firstValue: employee.currentSalary!,
                      firstLabel: "Current Salary"),
                ),
                Expanded(
                  child: EmployeeInfoWidgetItem(
                      firstValue: getNewSalary(employee),
                      firstLabel: "New Salary"),
                ),
              ],
            ),
            EmployeeInfoWidgetItem(
                firstValue: getNewStatus(employee),
                firstLabel: "Employee Status"),
            EmployeeInfoWidgetItem(
                firstValue: "${employee.level!}",
                firstLabel: "Employee Level")
          ],
        ),
      )),
    );
  }
}
