import 'package:pattern_composite/src/domain/model/department.dart';

class InMemoryEntity {
  Department? _company;

  Department? getCompany() => _company;

  void saveCompany(Department company) => _company = company;
}
