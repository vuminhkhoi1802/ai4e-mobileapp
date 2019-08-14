import 'package:flutter/material.dart';
import 'package:ai4e_mobileapp/screens/AuthScreen/main.dart';
import "package:ai4e_mobileapp/screens/DashboardScreen/main.dart";
import "package:ai4e_mobileapp/screens/SplashScreen/main.dart";
import "package:ai4e_mobileapp/screens/LoadingScreen/main.dart";
import "package:flutter/services.dart";

class Routes {
  Routes() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    runApp(
      new MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'EFCircular'),
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/auth': (BuildContext context) => AuthScreen(),
          '/dashboard': (BuildContext context) => DashboardScreen(),
          '/loading': (BuildContext context) => LoadingScreen(),
        },
      ),
    );
  }
}
