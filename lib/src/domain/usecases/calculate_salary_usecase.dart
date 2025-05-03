import 'package:pattern_composite/src/domain/model/gateway/organization_gateway.dart';

class CalculateSalaryUseCase {
  final OrganizationGateway _organizationGateway;

  CalculateSalaryUseCase(this._organizationGateway);

  double execute() {
    return _organizationGateway.getCompany().calculateSalary();
  }
}
