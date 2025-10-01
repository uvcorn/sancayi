import '../../domain/entities/customer.dart';
import '../../domain/repositories/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  @override
  Future<List<Customer>> fetchCustomers() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      Customer(
        initials: 'SoU',
        name: 'Souhel',
        type: 'supply',
        amount: 324,
        isCredit: true,
      ),
      Customer(
        initials: 'ShU',
        name: 'Shuhel',
        type: 'general',
        amount: 514,
        isCredit: false,
      ),
      Customer(
        initials: 'SaU',
        name: 'Sauhel',
        type: 'general',
        amount: 478,
        isCredit: false,
      ),
      Customer(
        initials: 'SwU',
        name: 'Swuhel',
        type: 'general',
        amount: 289,
        isCredit: false,
      ),
      Customer(
        initials: 'StU',
        name: 'Stuhel',
        type: 'supply',
        amount: 555,
        isCredit: true,
      ),
    ];
  }
}
