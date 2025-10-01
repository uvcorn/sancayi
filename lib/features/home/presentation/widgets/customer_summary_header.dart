import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sancayi/core/constants/app_strings.dart';
import 'package:sancayi/core/widgets/texts/custom_rich_text.dart';
import 'package:sancayi/core/widgets/texts/custom_text.dart';

class CustomerSummaryHeader extends StatelessWidget {
  final int totalCount;
  final VoidCallback? onSwapPressed;

  const CustomerSummaryHeader({
    super.key,
    required this.totalCount,
    this.onSwapPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          CustomText(
            text: "${AppStrings.total} ($totalCount)",
            fontWeight: FontWeight.bold,
          ),
          const Spacer(),

          CustomRichText(
            firstText: AppStrings.credit,
            isSlash: true,
            secondText: AppStrings.debit,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
