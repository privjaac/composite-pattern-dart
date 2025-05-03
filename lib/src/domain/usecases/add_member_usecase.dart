import 'package:pattern_composite/src/domain/model/department.dart';
import 'package:pattern_composite/src/domain/model/employee.dart';
import 'package:pattern_composite/src/domain/model/gateway/organization_gateway.dart';

class AddMemberUseCase {
  final OrganizationGateway _organizationGateway;

  AddMemberUseCase(this._organizationGateway);

  void execute(Department department, Employee employee) {
    department.addMember(employee);
    _organizationGateway.saveCompany(_organizationGateway.getCompany());
  }
}
