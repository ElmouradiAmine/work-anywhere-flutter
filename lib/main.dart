import 'dart:async';

import 'package:flutter/material.dart';
import 'package:work_anywhere_flutter/src/constants/themes.dart';
import 'package:work_anywhere_flutter/src/pages/home_page.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() {
   FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runZoned(() {
    runApp(App());
  }, onError: Crashlytics.instance.recordError);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Work Anywhere',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: HomePage(),
    );
  }
}
