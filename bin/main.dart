import 'package:pattern_composite/src/application/services/organization_service.dart';
import 'package:pattern_composite/src/infrastructure/driven/memory/entity/in_memory_entity.dart';
import 'package:pattern_composite/src/infrastructure/driven/memory/adapter/organization_adapter.dart';
import 'package:pattern_composite/src/presentation/cli/organization_cli.dart';

void main() {
  final inMemory = InMemoryEntity();
  final organizationAdapter = OrganizationAdapter(inMemory);
  final organizationService = OrganizationService(organizationAdapter);

  organizationService.initializeCompanyStructure();

  final cli = OrganizationCLI(organizationService);
  cli.displayCompanyStructure();
}
