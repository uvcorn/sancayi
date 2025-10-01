import 'package:sancayi/features/home/domain/entities/customer.dart';

abstract class CustomerRepository {
  Future<List<Customer>> fetchCustomers();
}
