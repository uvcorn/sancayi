// presentation/screens/home/widgets/customer_list.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sancayi/core/constants/app_strings.dart';
import 'package:sancayi/core/widgets/texts_widgets/custom_text.dart';
import 'package:sancayi/core/constants/app_colors.dart';
import '../../domain/entities/customer.dart';

class CustomerList extends StatelessWidget {
  final List<Customer> customers;
  final int selectedTabIndex;

  const CustomerList({
    super.key,
    required this.customers,
    required this.selectedTabIndex,
  });

  @override
  Widget build(BuildContext context) {
    if (customers.isEmpty) {
      return Expanded(
        child: Center(
          child: CustomText(
            text: selectedTabIndex == 2
                ? 'Supplier list is empty'
                : 'No customers found',
            fontSize: 18,
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: customers.length,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        itemBuilder: (context, index) {
          final customer = customers[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 6.h),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: ListTile(
              leading: customer.avatar != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(customer.avatar!),
                      radius: 22,
                    )
                  : CircleAvatar(
                      backgroundColor: Colors.red[100],
                      radius: 22,
                      child: CustomText(
                        text: customer.initials,
                        color: AppColors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              title: CustomText(text: customer.name),
              subtitle: CustomText(text: customer.type),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: customer.amount.toStringAsFixed(2),
                    color: customer.isCredit ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: customer.isCredit
                        ? AppStrings.receivables
                        : AppStrings.payAbles,
                    color: customer.isCredit ? Colors.green : Colors.red,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
