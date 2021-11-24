import 'package:flutter/material.dart';
import 'package:uts_mopro2_19552011328/dashboard/dashboard.dart';
import 'package:uts_mopro2_19552011328/splashscreen/splash.dart';

/**
@author Ahmad Fauzy Khamarullah - 19552011328 - TIF RM 19 CID
 */
/// ini adalah main
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uts_mopro2_19552011328',
      theme: ThemeData(
        primarySwatch: _primarySwatch,
      ),
      home: const SplashScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'dashboard':
            return MaterialPageRoute(
              builder: (_) {
                return const DashboardScreen();
              },
            );
          default:
        }
      },
    );
  }

  final MaterialColor _primarySwatch = const MaterialColor(
    0XFFFFFFFF,
    <int, Color>{
      50: Color(0XFFFFFFFF),
      100: Color(0XFFFFFFFF),
      200: Color(0XFFFFFFFF),
      300: Color(0XFFFFFFFF),
      400: Color(0XFFFFFFFF),
      500: Color(0XFFFFFFFF),
      600: Color(0XFFFFFFFF),
      700: Color(0XFFFFFFFF),
      800: Color(0XFFFFFFFF),
      900: Color(0XFFFFFFFF),
    },
  );
}
