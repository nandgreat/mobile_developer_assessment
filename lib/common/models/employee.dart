import 'package:hive/hive.dart';

part 'employee.g.dart';

@HiveType(typeId: 1)
class Employee {
  Employee({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.designation, 
      this.level, 
      this.productivityScore, 
      this.currentSalary, 
      this.employmentStatus,});

  Employee.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    designation = json['designation'];
    level = json['level'];
    productivityScore = json['productivity_score'];
    currentSalary = json['current_salary'];
    employmentStatus = json['employment_status'];
  }

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? firstName;

  @HiveField(2)
  String? lastName;

  @HiveField(3)
  String? designation;

  @HiveField(4)
  int? level;

  @HiveField(5)
  double? productivityScore;

  @HiveField(6)
  String? currentSalary;

  @HiveField(7)
  int? employmentStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['designation'] = designation;
    map['level'] = level;
    map['productivity_score'] = productivityScore;
    map['current_salary'] = currentSalary;
    map['employment_status'] = employmentStatus;
    return map;
  }

}