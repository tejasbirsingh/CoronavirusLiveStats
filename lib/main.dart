

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webSCrapper/HomePage.dart';
import 'package:webSCrapper/SplashScreen.dart';

void main(List<String> arguments) async {
//  print(await sp.initiate());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) =>  MyHomePage()
      },
    );
  }
}
