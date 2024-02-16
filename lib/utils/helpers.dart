import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_assessment/common/models/employee.dart';

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

showSnackBar({required title, required message, required type}) {
  var color = type == "error"
      ? Colors.red
      : (type == "success" ? Colors.green : Colors.blue);
  Get.snackbar(title, message, backgroundColor: color, colorText: Colors.white);
}

hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(new FocusNode());
}

String replaceCharAt(String oldString, int index, String newChar) {
  return oldString.substring(0, index) +
      newChar +
      oldString.substring(index + 1);
}

logItem(item) {
  if (kDebugMode) {
    print(item);
  }
}

bool filterEmployees(Employee employee, String inputText) {
  return (employee.firstName!.toLowerCase().contains(inputText.toLowerCase()) ||
      employee.lastName!.toLowerCase().contains(inputText.toLowerCase()) ||
      employee.designation!.toLowerCase().contains(inputText.toLowerCase()) ||
      employee.level.toString().contains(inputText.toLowerCase()));
}

String? validateEmailInput(String email) {
  if (email.isEmpty) return "Email is required";

  if (!isEmailValid(email)) {
    return "Enter a valid email address";
  }
  return null;
}

String getEmployeeStatus(double productivityScore) {
  if (productivityScore > 79) {
    return "Promotion";
  } else if (productivityScore > 49 && productivityScore <= 79) {
    return "No Change";
  } else if (productivityScore > 39 && productivityScore <= 49) {
    return "Demotion";
  } else {
    return "Termination";
  }
}

Future<String?> showCustomDialog(BuildContext context,
    {required String title, required String message}) async {
  return await showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, "false"),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'true'),
                child: const Text('OK'),
              ),
            ],
          )).then((value) => value);
}

String? validatePhoneInput(String email) {
  if (email.isEmpty) return "Phone number is required";

  if (email.length != 11) {
    return "Enter a valid phone number";
  }
  return null;
}

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

String getNewSalary(Employee employee) {
  var salaryRanges = [
    "70,000",
    "100,000",
    "120,000",
    "180,000",
    "200,000",
    "250,000",
  ];

  if (employee.productivityScore! > 49.0 &&
      employee.productivityScore! <= 79.0) {
    return employee.currentSalary.toString();
  } else if (employee.productivityScore! > 39.0 &&
      employee.productivityScore! <= 49.0) {
    int currentSalaryIndex = salaryRanges.indexOf(employee.currentSalary!);

    return salaryRanges[currentSalaryIndex--];
  } else if (employee.productivityScore! > 79.0) {
    int currentSalaryIndex = salaryRanges.indexOf(employee.currentSalary!);
    logItem(currentSalaryIndex);
    return (currentSalaryIndex == salaryRanges.length - 1)
        ? employee.currentSalary.toString()
        : salaryRanges[currentSalaryIndex + 1];
  } else {
    return "Termination";
  }
}

String getNewStatus(Employee employee) {
  var salaryRanges = [
    "70,000",
    "100,000",
    "120,000",
    "180,000",
    "200,000",
    "250,000",
  ];

  if (employee.productivityScore! > 49.0 &&
      employee.productivityScore! <= 79.0) {
    return "No Change";
  } else if (employee.productivityScore! > 39.0 &&
      employee.productivityScore! <= 49.0) {
    return employee.level == 0 ? "Terminated" : "Demoted";
  } else if (employee.productivityScore! > 79.0) {
    int currentSalaryIndex = salaryRanges.indexOf(employee.currentSalary!);
    logItem(currentSalaryIndex);
    return "Promoted";
  } else {
    return "Terminated";
  }
}

showNoInternetSnackBar() {
  showSnackBar(
      title: "Network Error", message: "No Internet Connection", type: 'error');
}
