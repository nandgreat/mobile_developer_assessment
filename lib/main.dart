import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:mobile_assessment/common/models/employee.dart';
import 'package:mobile_assessment/root_widget.dart';
import 'package:mobile_assessment/utils/helpers.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;


Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    Directory directory = await pathProvider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.initFlutter();

    Hive.registerAdapter(EmployeeAdapter());
    await Hive.openBox('employee_box');

    runApp(const MobileAssessmentApp(
      isDebug: true,
    ));
  }, (exception, stackTrace) async {
    logItem(exception);
  });
}
