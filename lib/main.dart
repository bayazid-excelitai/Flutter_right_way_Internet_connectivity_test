import 'package:flutter/material.dart';
import 'package:flutter_internet_connection_test/helper/internet_check_helper.dart';
import 'package:flutter_internet_connection_test/view/pages/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<InternetConnectionStatus>(
      initialData: InternetConnectionStatus.connected,
      create: (_) {
        return InternetConnectionChecker().onStatusChange;
      },
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<InternetCheckerHelper>( create: (context) => InternetCheckerHelper()),
        ],
        child: MaterialApp(
          title: 'Flutter Internet Check',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen(),
        ),
      );
    }
      ),
    );
  }
}


