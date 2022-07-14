import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:quran_app/Screens/MainPage/Home/qibal/flutter_qiblah.dart';
import '../../../../widgets.dart';
import 'comapss.dart';

class DirectionTOQiblah extends StatefulWidget {
  @override
  _DirectionTOQiblahState createState() => _DirectionTOQiblahState();
}

class _DirectionTOQiblahState extends State<DirectionTOQiblah> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  @override
  // void initState() {
  //   // locationPosition();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff0c7b93),
        primaryColorLight: Color(0xff00a8cc),
        primaryColorDark: Color(0xff27496d),
        accentColor: Color(0xffecce6d),
      ),
      darkTheme: ThemeData.dark().copyWith(accentColor: Color(0xffecce6d)),
      home: Scaffold(
        appBar: mainScreenAppBarPush(context, "Direction to Qiblah"),
        body: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return CircularProgressIndicator();
            if (snapshot.hasError)
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );

            if (snapshot.data!)
              return QiblahCompass();
            else
              return Text("No data");
          },
        ),
      ),
    );
  }
}
