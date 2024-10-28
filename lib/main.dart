import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasabih/app_injection.dart' as di;
import 'package:tasabih/features/home/presentation/cubit/tasabih_cubit.dart';
import 'package:tasabih/features/home/presentation/views/home_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main(List<String> args) {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => di.getIt<TasabihCubit>(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            home: child,
          ),
        );
      },
      child: HomeScreen(),
    );
  }
}
