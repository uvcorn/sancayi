import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sancayi/core/constants/app_colors.dart';
import 'package:sancayi/core/constants/app_strings.dart';
import 'package:sancayi/features/home/presentation/providers/customer_provider.dart';

import '../../../../core/widgets/texts/custom_text.dart';
import '../widgets/customer_list.dart';
import '../widgets/customer_summary_header.dart';
import '../widgets/search_box.dart';
import '../widgets/total_balance_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CustomerProvider>(context, listen: false).loadCustomers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CustomerProvider>(context);
    final tabs = ['All', 'Customer', 'Supplier'];
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.red.withOpacity(0.2),
        title: CustomText(
          text: AppStrings.appBarTitle,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.help_outline)),
          TextButton(
            onPressed: () {},
            child: CustomText(text: AppStrings.help),
          ),
        ],
      ),

      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                TotalBalanceCards(
                  totalCredit: provider.totalCredit,
                  totalDebit: provider.totalDebit,
                ),
                SearchBox(
                  onChanged: (query) {
                    // implement search logic here if needed
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: 2,
                  ),
                  child: Row(
                    children: List.generate(tabs.length, (index) {
                      final bool isSelected = provider.selectedIndex == index;
                      return Expanded(
                        child: Container(
                          height: 36.h,
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
                            onPressed: () => provider.changeTab(index),
                            child: CustomText(
                              text: tabs[index],
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.grey,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                CustomerSummaryHeader(
                  totalCount: provider.filteredCustomers.length,
                  onSwapPressed: () {},
                ),

                Expanded(
                  child: CustomerList(
                    customers: provider.filteredCustomers,
                    selectedTabIndex: provider.selectedIndex,
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: CustomText(
          text: AppStrings.addCustomer,
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
        icon: const Icon(Icons.person_add_alt_1, color: AppColors.white),
        backgroundColor: AppColors.red,
      ),
    );
  }
}
