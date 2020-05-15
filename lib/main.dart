import 'package:flutter/material.dart';
import 'package:work_anywhere_flutter/src/constants/themes.dart';
import 'package:work_anywhere_flutter/src/pages/home_page.dart';
import 'package:work_anywhere_flutter/src/resources/job_api.dart';

void main() {
  
  return runApp(App());
  
  
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Work Anywhere',
      darkTheme: darkTheme,
      theme: lightTheme,
      home: HomePage(),

    );
  }
}
