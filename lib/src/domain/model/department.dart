import 'employee.dart';

class Department implements Employee {
  final String _name;
  final List<Employee> _members = [];

  Department(this._name);

  @override
  String get name => _name;

  @override
  double calculateSalary() {
    return _members.fold(0.0, (sum, member) => sum + member.calculateSalary());
  }

  @override
  void showDetails(String indentation) {
    print('$indentation+ department: $_name');
    for (var member in _members) {
      member.showDetails('$indentation  ');
    }
    print(
      '$indentation Total salaries: \$${calculateSalary().toStringAsFixed(2)}',
    );
  }

  void addMember(Employee member) => _members.add(member);

  void deleteMember(Employee member) => _members.remove(member);

  List<Employee> get members => List.unmodifiable(_members);
}
