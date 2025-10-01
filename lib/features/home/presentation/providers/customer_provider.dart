import 'package:flutter/material.dart';
import 'package:sancayi/features/home/domain/entities/customer.dart';

import '../../domain/usecases/get_customers_usecase.dart';

class CustomerProvider extends ChangeNotifier {
  final GetCustomersUsecase useCase;
  List<Customer> _allCustomers = [];
  List<Customer> filteredCustomers = [];
  int selectedIndex = 0;
  CustomerProvider(this.useCase);
  bool isLoading = false;
  Future<void> loadCustomers() async {
    isLoading = true;
    notifyListeners();
    _allCustomers = await useCase.call();
    applyFilter();
    isLoading = false;
    notifyListeners();
  }

  void applyFilter() {
    final filterType = selectedIndex == 0
        ? 'all'
        : selectedIndex == 1
        ? 'general'
        : 'supply';
    filteredCustomers = useCase.filterByType(_allCustomers, filterType);
    notifyListeners();
  }

  double get totalCredit => useCase.totalCredit(filteredCustomers);

  double get totalDebit => useCase.totalDebit(filteredCustomers);

  void changeTab(int index) {
    selectedIndex = index;
    applyFilter();
  }
}
