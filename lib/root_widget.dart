import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_assessment/modules/home/presentation/home_screen.dart';

import 'common/enums/theme_type.dart';
import 'common/theme/app_theme.dart';
import 'modules/home/presentation/employee_details.dart';

class MobileAssessmentApp extends StatefulWidget {
  final bool isDebug;

  const MobileAssessmentApp({Key? key, this.isDebug = true}) : super(key: key);

  @override
  State<MobileAssessmentApp> createState() => _MobileAssessmentAppState();
}

class _MobileAssessmentAppState extends State<MobileAssessmentApp> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = AppTheme.getTheme(context); // or ThemeType.Dark

    final _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/employee/:userId',
          builder: (context, state) => EmployeeDetailsScreen(
              id: int.parse(state.pathParameters['userId']!)),
        ),
      ],
    );

    return MaterialApp.router(
      theme: themeData,
      routerConfig: _router,
    );
  }
}
