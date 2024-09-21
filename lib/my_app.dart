import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clon_app/shared/theme/ligth_theme.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageControllerCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ligthTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
