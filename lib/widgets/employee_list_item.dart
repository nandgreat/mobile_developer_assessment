import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_assessment/common/models/employee.dart';

class EmployeeWidget extends StatelessWidget {
  final int index;
  final Employee employee;
  final VoidCallback onPress;

  const EmployeeWidget({Key? key, required this.index, required this.employee, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: InkWell(
        onTap: onPress,
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: 5.0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${employee.firstName!} ${employee.lastName!}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18.0)),
                            Text(employee.designation!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal, color: Colors.grey)),
                            Container(
                              child: Text(employee.currentSalary.toString()),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
