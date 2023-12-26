import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traffic_light/helper/cache/cache_helper.dart';
import 'package:traffic_light/app/view/screens/home.dart';

import 'app/controllers/app_cubit/app_cubit.dart';
import 'helper/constants/app_contstants.dart';
import 'helper/methods/init_color_times_and_view_type.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await initTimesAndTrafficView();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..initTrafficViewType(AppConstants.trafficViewType),
      child: ScreenUtilInit(
        designSize: const Size(430, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Task',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: child,
          );
        },
        child: const HomeScreen(),
      ),
    );
  }
}

