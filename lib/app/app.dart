import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/utils/app_strings.dart';
import '../core/utils/app_styles.dart';
import '../di/service_locator.dart';
import '../features/products/presentation/cubit/product_cubit.dart';
import '../features/products/presentation/product_screen.dart';

class RouteApp extends StatelessWidget {
  const RouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(386, 862),
      builder: (context, child) {
        return MaterialApp(
          title: AppStrings.routeApp,
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          home: BlocProvider(
            create: (_) => sl<ProductCubit>()..getProducts(),
            child: ProductScreen(),
          ),
        );
      },
    );
  }
}
