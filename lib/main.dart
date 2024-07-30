import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/home/bloc/home_bloc.dart';
import 'package:shop_app/screens/profile/bloc/profile_bloc.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

import 'routes.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc()..add(GetUserEvent())),
        BlocProvider<HomeBloc>(
            create: (context) => HomeBloc()..add(FetchPopularProductsEvent()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: AppTheme.lightTheme(context),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
