// presentation/screens/home/widgets/total_balance_cards.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sancayi/core/constants/app_strings.dart';
import 'package:sancayi/core/widgets/texts/custom_text.dart';

class TotalBalanceCards extends StatelessWidget {
  final double totalCredit;
  final double totalDebit;

  const TotalBalanceCards({
    super.key,
    required this.totalCredit,
    required this.totalDebit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0.h),
      child: Row(
        children: [
          // Credit Card
          Expanded(
            child: Container(
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: totalCredit.toStringAsFixed(2),
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    CustomText(
                      text: AppStrings.receivables,
                      color: Colors.green,
                      fontSize: 13,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),

          // Debit Card
          Expanded(
            child: Container(
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: totalDebit.toStringAsFixed(2),
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    CustomText(
                      text: AppStrings.payAbles,
                      color: Colors.red,
                      fontSize: 13,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
