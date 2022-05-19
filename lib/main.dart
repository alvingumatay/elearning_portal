// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:elearning_portal/pages/home.dart';
import 'package:elearning_portal/pages/login.dart';
import 'package:elearning_portal/pages/auth.dart';
import 'package:elearning_portal/pages/history.dart';
import 'package:elearning_portal/pages/twg.dart';
import 'package:elearning_portal/pages/vmcm.dart';
import 'package:elearning_portal/pages/directory.dart';
import 'package:elearning_portal/pages/newsarchieve.dart';
import 'package:elearning_portal/pages/newsarticle.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/login': (context) => Login(),
        '/history': (context) => History(),
        '/auth': (context) => Auth(),
        '/twg': (context) => TWG(),
        '/vmcm': (context) => VMCM(),
        '/directory': (context) => Directory(),
        '/newsarchieve': (context) => NewsArchieve(),
        '/newsarticle': (context) => NewsArticle(),
      },
    );
  }
}
