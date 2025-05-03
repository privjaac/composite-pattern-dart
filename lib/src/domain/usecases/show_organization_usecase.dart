import 'package:pattern_composite/src/domain/model/gateway/organization_gateway.dart';

class ShowOrganizationUseCase {
  final OrganizationGateway _organizationGateway;

  ShowOrganizationUseCase(this._organizationGateway);

  void execute(String indentation) {
    final company = _organizationGateway.getCompany();
    company.showDetails(indentation);
  }
}
