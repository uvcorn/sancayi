class Customer {
  final String? avatar;
  final String initials;
  final String name;
  final String type;
  final double amount;
  final bool isCredit;

  Customer({
    this.avatar,
    required this.initials,
    required this.name,
    required this.type,
    required this.amount,
    required this.isCredit,
  });
}
