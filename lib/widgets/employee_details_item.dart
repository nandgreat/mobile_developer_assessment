import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget EmployeeInfoWidgetItem(
    {required String firstLabel, required String firstValue}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: Row(
      children: [
        Expanded(
            child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstLabel,
                style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.grey),
              ),
              Text(firstValue,  style: const TextStyle(fontWeight: FontWeight.bold,  fontSize: 18,))
            ],
          ),
        )),
      ],
    ),
  );
}
