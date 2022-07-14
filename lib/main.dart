import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/Provider/main_provider.dart';
import 'package:quran_app/Screens/MainPage/main_screen.dart';

void main() async {
  AwesomeNotifications().initialize(
      'resource://drawable/res_diceeee',
      [
        NotificationChannel(
            channelKey: 'scheduled_channel',
            channelName: 'Scheduled notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white,
            locked: true,
            importance: NotificationImportance.High,
            soundSource: 'resource://raw/res_azanf')
      ],
      debug: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MyProvider(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color(0xff002E33),
          ),
          // primarySwatch: ,
          fontFamily: 'arabic',
        ),
        home: MainScreen(),
      ),
    );
  }
}
