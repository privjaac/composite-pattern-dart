import 'package:pattern_composite/src/domain/model/department.dart';
import 'package:pattern_composite/src/domain/model/employee.dart';

abstract interface class OrganizationGateway {
  Department getCompany();

  void saveCompany(Department company);

  List<Employee> getAllEmployees();

  Employee? findEmployeeByName(String name);
}
