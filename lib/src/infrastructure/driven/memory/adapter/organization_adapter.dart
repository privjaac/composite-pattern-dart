import 'package:pattern_composite/src/domain/model/department.dart';
import 'package:pattern_composite/src/domain/model/employee.dart';
import 'package:pattern_composite/src/domain/model/gateway/organization_gateway.dart';
import 'package:pattern_composite/src/infrastructure/driven/memory/entity/in_memory_entity.dart';

class OrganizationAdapter implements OrganizationGateway {
  final InMemoryEntity _inMemory;

  OrganizationAdapter(this._inMemory);

  @override
  Department getCompany() {
    return _inMemory.getCompany() ?? Department('Empty Company');
  }

  @override
  void saveCompany(Department company) {
    _inMemory.saveCompany(company);
  }

  @override
  List<Employee> getAllEmployees() {
    final company = getCompany();
    final allEmployees = <Employee>[];
    _collectEmployees(company, allEmployees);
    return allEmployees;
  }

  void _collectEmployees(Employee employee, List<Employee> collection) {
    collection.add(employee);

    if (employee is Department) {
      for (final member in employee.members) {
        _collectEmployees(member, collection);
      }
    }
  }

  @override
  Employee? findEmployeeByName(String name) {
    final employees = getAllEmployees();
    for (final employee in employees) {
      if (employee.name == name) return employee;
    }
    return null;
  }
}
