import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_app/route_builder.dart';
import 'package:test_app/second_page.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String _title = 'TestApp';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: FirstPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case SecondPage.routeName:
            return Routing(
                child: this, childCurrent: SecondPage(), settings: settings);
            break;
          default:
            return null;
        }
      },
    );
  }
}