import 'package:pattern_composite/src/application/services/organization_service.dart';

class OrganizationCLI {
  final OrganizationService _organizationService;

  OrganizationCLI(this._organizationService);

  void displayCompanyStructure() {
    _organizationService.showOrganizationStructure('');
  }
}
