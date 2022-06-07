/*
Title: DepED Marikina eLearning Program
Author: Rio Conales (rioconales@gmail.com)
Developer: DepED Marikina
Module: 1.0
Date Created: 5-31-2022
*/

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:elearning_portal/pages/splash.dart';
import 'package:elearning_portal/pages/student/profile.dart';
import 'package:flutter/material.dart';
import 'package:elearning_portal/pages/home.dart';
import 'package:elearning_portal/pages/login.dart';
import 'package:elearning_portal/pages/fp.dart';
import 'package:elearning_portal/pages/confirm_fp.dart';
import 'package:elearning_portal/pages/about.dart';
import 'package:elearning_portal/pages/twg.dart';
import 'package:elearning_portal/pages/directory.dart';
import 'package:elearning_portal/pages/news/newsarchieve.dart';
import 'package:elearning_portal/pages/news/newsarticle.dart';
import 'package:elearning_portal/pages/student/home.dart';
import 'package:flutter/services.dart';

import 'pages/student/subject.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/fp': (context) => Forgot(),
        '/confirm-fp': (context) => ConfirmFP(),
        '/history': (context) => About(),
        '/twg': (context) => TWG(),
        '/directory': (context) => Directory(),
        '/newsarchieve': (context) => NewsArchieve(),
        '/newsarticle': (context) => NewsArticle(),
        '../student/home': (context) => Student(
              id: '',
              email: '',
              grade: '',
              school: '',
              subj: null,
              announce: null,
            ),
        '../student/profile': (context) => Profile(
              id: '',
              email: '',
              grade: '',
              school: '',
              subj: null,
              announce: null,
            ),
        '../student/subject': (context) => Subject(
              id: '',
              subcode: '',
              subjnam: '',
              grade: '',
              email: '',
              school: '',
              userinfo: null,
              dlm: null,
            ),
      },
    );
  }
}
