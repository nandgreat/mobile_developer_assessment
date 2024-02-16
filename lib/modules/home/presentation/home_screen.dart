import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_assessment/common/models/employee.dart';
import 'package:mobile_assessment/controllers/HomeController.dart';
import 'package:mobile_assessment/utils/helpers.dart';
import 'package:mobile_assessment/widgets/LoadingWidget.dart';

import '../../../widgets/employee_list_item.dart';
import '../../widgets/inputs/app_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee List"),
      ),
      body: Obx(
        () => SafeArea(
            child: _homeController.isLoading.value
                ? const LoadingWidget()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 5),
                        child: CustomTextField(
                          hintText: 'Enter Email',
                          onChanged: (value) =>
                              _homeController.handleSearch(value!),
                          controller: _homeController.searchController,
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                          labelText: 'Search Employee',
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: _homeController.filteredEmployees.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              Employee employee =
                                  _homeController.filteredEmployees[index];
                              return EmployeeWidget(
                                  onPress: () {
                                    logItem(employee.id);
                                    GoRouter.of(context).push('/employee/${employee.id}');
                                  },
                                  index: index,
                                  employee: employee);
                            }),
                      ),
                    ],
                  )),
      ),
    );
  }
}
