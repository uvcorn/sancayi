import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> customers = [
    {
      'avatar': null,
      'initials': 'SoU',
      'name': 'Souhel',
      'type': 'supply',
      'amount': 324.00,
      'isCredit': true,
    },
    {
      'avatar': null,
      'initials': 'ShU',
      'name': 'Shuhel',
      'type': 'সাধারণ',
      'amount': 514.00,
      'isCredit': false,
    },
    {
      'avatar': null,
      'initials': 'SaU',
      'name': 'Sauhel',
      'type': 'সাধারণ',
      'amount': 478.00,
      'isCredit': false,
    },
    {
      'avatar': null,
      'initials': 'SwU',
      'name': 'Swuhel',
      'type': 'সাধারণ',
      'amount': 289.00,
      'isCredit': false,
    },
    {
      'avatar': null,
      'initials': 'StU',
      'name': 'Stuhel',
      'type': 'supply',
      'amount': 555.00,
      'isCredit': true,
    },
  ];
  final List<String> tabs = ['All', 'Customer', 'Sapliar'];
  double get totalCredit => customers
      .where((e) => e['isCredit'] == true)
      .fold(0.0, (sum, e) => sum + (e['amount'] as double));
  double get totalDebit => customers
      .where((e) => e['isCredit'] == false)
      .fold(0.0, (sum, e) => sum + (e['amount'] as double));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Expence',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.help_outline)),
          TextButton(onPressed: () {}, child: const Text('help')),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Text(
                            totalCredit.toStringAsFixed(2),
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "মোট পাবো",
                            style: TextStyle(color: Colors.red, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            totalDebit.toStringAsFixed(2),
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "মোট দেবো",
                            style: TextStyle(color: Colors.green, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 2),
            child: Row(
              children: List.generate(tabs.length, (index) {
                final bool isSelected = _selectedIndex == index;
                return Expanded(
                  child: Container(
                    height: 36,
                    margin: EdgeInsets.only(
                      right: index != tabs.length - 1 ? 8 : 0,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected
                            ? Colors.red[400]
                            : Colors.white,
                        foregroundColor: isSelected
                            ? Colors.white
                            : Colors.grey,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text(
                  "মোট (${filteredList.length} জন)",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "পাবে/দেবে",
                  style: TextStyle(
                    color: Colors.red[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.swap_vert, color: Colors.red[400], size: 18),
              ],
            ),
          ),

          _buildScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text(
          'কাস্টোমার যোগ করুন',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.person_add_alt_1, color: Colors.white),
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget _buildScreen() {
    return Expanded(
      child: filteredList.isEmpty
          ? Center(
              child: Text(
                _selectedIndex == 2
                    ? 'Supplier list is empty'
                    : 'No customers found',
                style: TextStyle(fontSize: 18),
              ),
            )
          : _buildCustomerList(),
    );
  }

  Widget _buildCustomerList() {
    return ListView.builder(
      itemCount: filteredList.length,
      padding: EdgeInsets.symmetric(horizontal: 8),
      itemBuilder: (context, index) {
        final customer = filteredList[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: ListTile(
            leading: customer['avatar'] != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(customer['avatar'] as String),
                    radius: 22,
                  )
                : CircleAvatar(
                    backgroundColor: Colors.red[100],
                    radius: 22,
                    child: Text(
                      customer['initials'] ?? '',
                      style: TextStyle(
                        color: Colors.red[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            title: Text(customer['name']),
            subtitle: Text(customer['type']),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${customer['amount']}',
                  style: TextStyle(
                    color: customer['isCredit'] ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  customer['isCredit'] ? 'পাবো' : 'দেবো',
                  style: TextStyle(
                    color: customer['isCredit'] ? Colors.red : Colors.green,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Map<String, dynamic>> get filteredList {
    if (_selectedIndex == 0) return customers;
    if (_selectedIndex == 1) {
      // Show only customers with type "সাধারণ"
      return customers.where((e) => e['type'] == 'সাধারণ').toList();
    }
    if (_selectedIndex == 2) {
      // Show only suppliers
      return customers.where((e) => e['type'] == 'supply').toList();
    }
    return [];
  }
}
