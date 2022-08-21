import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/bloc_observer.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/routes.dart';
import 'package:news_app/screens/news_screen.dart';

import 'cubit/states.dart';
import 'network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.isDark}) : super(key: key);
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit()
          ..getBusiness()
          ..getSports()
          ..getScience()
        ..changeAppMode(fromShared: isDark)
        ,
        child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                      titleSpacing: 20,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Colors.white,
                          systemNavigationBarColor: Color(0xFF000000),
                          systemNavigationBarIconBrightness: Brightness.light,
                          statusBarIconBrightness: Brightness.dark,
                          statusBarBrightness: Brightness.light),
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      iconTheme: IconThemeData(color: Colors.black),
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.deepOrange,
                      elevation: 20.0),
                  textTheme: const TextTheme(
                      bodyText1: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black))),
              darkTheme: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  scaffoldBackgroundColor: HexColor('333739'),
                  appBarTheme: AppBarTheme(
                      titleSpacing: 20,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: HexColor('333739'),
                          systemNavigationBarColor: Colors.white,
                          systemNavigationBarIconBrightness: Brightness.light,
                          statusBarIconBrightness: Brightness.light,
                          statusBarBrightness: Brightness.light),
                      backgroundColor: HexColor('333739'),
                      elevation: 0.0,
                      iconTheme: const IconThemeData(color: Colors.white),
                      titleTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation: 20.0,
                    backgroundColor: HexColor('333739'),
                  ),
                  textTheme: const TextTheme(
                      bodyText1: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white))),
              themeMode: NewsCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              routes: routes,
              initialRoute: NewsScreen.routeName,
            );
          },
        ));
  }
}
