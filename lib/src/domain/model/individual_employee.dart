import 'employee.dart';

class IndividualEmployee implements Employee {
  final String _name;
  final String role;
  final double baseSalary;

  IndividualEmployee(this._name, this.role, this.baseSalary);

  @override
  String get name => _name;

  @override
  double calculateSalary() => baseSalary;

  @override
  void showDetails(String indentation) {
    print('$indentation- $name ($role): \$${baseSalary.toStringAsFixed(2)}');
  }
}
