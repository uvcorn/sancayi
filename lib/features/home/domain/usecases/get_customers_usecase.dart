import '../entities/customer.dart';
import '../repositories/customer_repository.dart';

class GetCustomersUsecase {
  final CustomerRepository repository;

  GetCustomersUsecase(this.repository);

  Future<List<Customer>> call() async {
    return await repository.fetchCustomers();
  }

  List<Customer> filterByType(List<Customer> customers, String type) {
    if (type == 'all') return customers;
    if (type == 'general') {
      return customers.where((customer) => customer.type == 'general').toList();
    }
    if (type == 'supply') {
      return customers.where((customer) => customer.type == 'supply').toList();
    }
    return [];
  }

  double totalCredit(List<Customer> customers) =>
      customers.where((c) => c.isCredit).fold(0.0, (sum, c) => sum + c.amount);
  double totalDebit(List<Customer> customers) =>
      customers.where((c) => !c.isCredit).fold(0.0, (sum, c) => sum + c.amount);
}
