import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sancayi/features/home/presentation/screens/home_screen.dart';

import 'features/home/data/repositories/customer_repository_impl.dart';
import 'features/home/domain/usecases/get_customers_usecase.dart';
import 'features/home/presentation/providers/customer_provider.dart';

void main() {
  final repository = CustomerRepositoryImpl();
  final useCase = GetCustomersUsecase(repository);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CustomerProvider(useCase)),
      ],
      child: const Myapp(),
    ),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X reference size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
          // theme: ThemeData(primaryColor: Color(0xFFD32F2F)),
        );
      },
    );
  }
}
