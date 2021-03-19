import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {

  static const routeName = '/second';
  final String _title = 'MySecondPage';

  @override
  Widget build(BuildContext context) {
    final int count = ModalRoute.of(context).settings.arguments;

    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
            child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    "Количество Привет :  $count",
                    style: TextStyle(
                      backgroundColor: Colors.grey,
                      fontSize: 28
                    ),),
                ElevatedButton(
                  child: Text('Влево'),
                  onPressed: () => Navigator.pop(context),
                  style: ButtonStyle(
                      textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 30))),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }


}
