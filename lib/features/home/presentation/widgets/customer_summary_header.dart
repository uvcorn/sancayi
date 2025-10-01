import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sancayi/core/constants/app_colors.dart';
import 'package:sancayi/core/constants/app_strings.dart';
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
          CustomText(
            text: AppStrings.receivablePayable,
            color: AppColors.red,
            fontWeight: FontWeight.bold,
          ),
          IconButton(
            icon: Icon(Icons.swap_vert, color: AppColors.red, size: 18.r),
            onPressed: onSwapPressed ?? () {},
          ),
        ],
      ),
    );
  }
}
