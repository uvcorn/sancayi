import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sancayi/core/constants/app_strings.dart';
import 'package:sancayi/core/widgets/texts/custom_text.dart';

import '../../../../core/constants/app_colors.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.red.withOpacity(0.1), // light pink background
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
        ),
        child: Row(
          children: [
            // Receivables
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: totalCredit.toStringAsFixed(2),
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                  SizedBox(height: 4.h),
                  CustomText(
                    text: AppStrings.credit,
                    color: Colors.green,
                    fontSize: 13.sp,
                  ),
                ],
              ),
            ),

            // Divider
            Container(width: 1, height: 40.h, color: Colors.grey[300]),

            // Payables
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: totalDebit.toStringAsFixed(2),
                    color: AppColors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                  SizedBox(height: 4.h),
                  CustomText(
                    text: AppStrings.debit,
                    color: Colors.red,
                    fontSize: 13.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
