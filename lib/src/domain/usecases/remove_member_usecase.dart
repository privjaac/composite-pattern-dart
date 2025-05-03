import 'package:pattern_composite/src/domain/model/department.dart';
import 'package:pattern_composite/src/domain/model/employee.dart';
import 'package:pattern_composite/src/domain/model/gateway/organization_gateway.dart';

class RemoveMemberUseCase {
  final OrganizationGateway _organizationGateway;

  RemoveMemberUseCase(this._organizationGateway);

  void execute(Department department, Employee employee) {
    department.deleteMember(employee);
    _organizationGateway.saveCompany(_organizationGateway.getCompany());
  }
}
