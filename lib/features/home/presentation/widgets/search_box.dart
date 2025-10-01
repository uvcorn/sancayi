// presentation/screens/home/widgets/search_box.dart

import 'package:flutter/material.dart';
import 'package:sancayi/core/constants/app_strings.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const SearchBox({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            hintText: AppStrings.search,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
