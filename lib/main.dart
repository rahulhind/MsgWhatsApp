import 'package:flutter/material.dart';
import 'package:msgwhatsapp/screens/homeScreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'MsgWhat',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        home: HomeScreen(),
      );
    });
  }
}
