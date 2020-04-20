import 'package:flutter/material.dart';
import 'package:online_food_booking/src/ui/screens/home/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFFFFFFF),
          primaryColor: Color(0xFFFFFFFF),
          primarySwatch: Colors.red,
          tabBarTheme: TabBarTheme(
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.black45),
          textTheme: TextTheme(
              headline: TextStyle(
                  color: Colors.black45,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              title: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w800),
              subtitle: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.w800),
              subhead: TextStyle(
                  color: Colors.black45,
                  fontSize: 12,
                  fontWeight: FontWeight.w600))),
      home: Home(),
    );
  }
}
