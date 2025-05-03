import 'package:pattern_composite/src/domain/model/department.dart';
import 'package:pattern_composite/src/domain/model/employee.dart';
import 'package:pattern_composite/src/domain/model/gateway/organization_gateway.dart';
import 'package:pattern_composite/src/domain/model/individual_employee.dart';
import 'package:pattern_composite/src/domain/usecases/add_member_usecase.dart';
import 'package:pattern_composite/src/domain/usecases/calculate_salary_usecase.dart';
import 'package:pattern_composite/src/domain/usecases/remove_member_usecase.dart';
import 'package:pattern_composite/src/domain/usecases/show_organization_usecase.dart';

class OrganizationService {
  final OrganizationGateway _organizationGateway;
  late final AddMemberUseCase _addMemberUseCase;
  late final RemoveMemberUseCase _removeMemberUseCase;
  late final ShowOrganizationUseCase _showOrganizationUseCase;
  late final CalculateSalaryUseCase _calculateSalaryUseCase;

  OrganizationService(this._organizationGateway) {
    _addMemberUseCase = AddMemberUseCase(_organizationGateway);
    _removeMemberUseCase = RemoveMemberUseCase(_organizationGateway);
    _showOrganizationUseCase = ShowOrganizationUseCase(_organizationGateway);
    _calculateSalaryUseCase = CalculateSalaryUseCase(_organizationGateway);
  }

  Department getCompany() => _organizationGateway.getCompany();

  void addEmployeeToDepartment(Department department, Employee employee) {
    _addMemberUseCase.execute(department, employee);
  }

  void removeEmployeeFromDepartment(Department department, Employee employee) {
    _removeMemberUseCase.execute(department, employee);
  }

  void showOrganizationStructure(String indentation) {
    _showOrganizationUseCase.execute(indentation);
  }

  double calculateTotalSalary() {
    return _calculateSalaryUseCase.execute();
  }

  void initializeCompanyStructure() {
    final company = Department('Pragma');
    final marcoEmployee = IndividualEmployee('Marco', 'CTO', 20000);
    company.addMember(marcoEmployee);

    final development = Department('Chapter Backend');
    final anaEmployee = IndividualEmployee('Ana', 'Java Senior', 5000);
    final juanEmployee = IndividualEmployee('Juan', 'Python Junior', 3000);
    development.addMember(anaEmployee);
    development.addMember(juanEmployee);
    company.addMember(development);

    final frontend = Department('Chapter Frontend');
    final mariaEmployee = IndividualEmployee('María', 'UI/UX Designer', 4000);
    final pedroEmployee = IndividualEmployee('Pedro', 'Flutter Senior', 3500);
    frontend.addMember(mariaEmployee);
    frontend.addMember(pedroEmployee);
    company.addMember(frontend);

    final marketing = Department('Marketing');
    marketing.addMember(IndividualEmployee('Luisa', 'Marketing Manager', 4500));
    marketing.addMember(IndividualEmployee('Carlos', 'Social Media', 2800));
    company.addMember(marketing);

    final sales = Department('Sales');
    sales.addMember(IndividualEmployee('Luis', 'Sales Manager', 1));
    sales.addMember(IndividualEmployee('Manuel', 'Sales', 2));
    marketing.addMember(sales);

    _organizationGateway.saveCompany(company);
  }
}
