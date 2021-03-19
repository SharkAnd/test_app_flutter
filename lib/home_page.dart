import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:test_app/second_page.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  int _count = 0;
  final String _message = 'Привет';
  final String _title = 'MyTestApp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('ПРИВЕТ'),
              onPressed: _onPressHello,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 40))),
            ),
            ElevatedButton(
              child: Text('Вправо'),
              onPressed: _onNextPage,
              style: ButtonStyle(
                  textStyle:
                  MaterialStateProperty.all(TextStyle(fontSize: 30))),
            ),
          ],
        )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _onPressHello() async {
    setState(() {
      _count++;
    });
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'channelId', 'channelName', 'channelDescription',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin
        .show(0, _message, '$_count', notificationDetails, payload: 'item x');
  }

  void _onNextPage() {
    Navigator.pushNamed(context, SecondPage.routeName, arguments: _count);
  }
}
