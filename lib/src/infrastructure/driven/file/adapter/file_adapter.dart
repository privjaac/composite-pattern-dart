import 'dart:convert';
import 'dart:io';

import 'package:pattern_composite/src/domain/model/department.dart';
import 'package:pattern_composite/src/domain/model/individual_employee.dart';

class FileAdapter {
  final String _filePath;

  FileAdapter(this._filePath);

  Future<Department?> getCompany() async {
    final file = File(_filePath);
    if (!await file.exists()) return null;

    final jsonString = await file.readAsString();
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    return _deserializeDepartment(jsonMap);
  }

  Future<void> saveCompany(Department company) async {
    final file = File(_filePath);
    final jsonMap = _serializeDepartment(company);
    await file.writeAsString(jsonEncode(jsonMap));
  }

  Map<String, dynamic> _serializeDepartment(Department department) {
    return {
      'type': 'department',
      'name': department.name,
      'members':
          department.members.map((member) {
            if (member is Department) {
              return _serializeDepartment(member);
            } else if (member is IndividualEmployee) {
              return {
                'type': 'employee',
                'name': member.name,
                'role': member.role,
                'baseSalary': member.baseSalary,
              };
            }
            return <String, dynamic>{};
          }).toList(),
    };
  }

  Department _deserializeDepartment(Map<String, dynamic> json) {
    final department = Department(json['name'] as String);

    final membersList = json['members'] as List;
    for (final memberJson in membersList) {
      final memberMap = memberJson as Map<String, dynamic>;
      final type = memberMap['type'] as String;

      if (type == 'department') {
        department.addMember(_deserializeDepartment(memberMap));
      } else if (type == 'employee') {
        department.addMember(
          IndividualEmployee(
            memberMap['name'] as String,
            memberMap['role'] as String,
            memberMap['baseSalary'] as double,
          ),
        );
      }
    }

    return department;
  }
}
