// ignore_for_file: use_key_in_widget_constructors

/*
Title: DepED Marikina eLearning Program
Author: Rio Conales (rioconales@gmail.com)
Developer: DepED Marikina
Module: 1.0
Date Created: 5-31-2022
*/

//import 'package:elearning_portal/pages/student/dlm/standard.dart';
//import 'package:elearning_portal/pages/student/dlm/fqdlm.dart';

import 'package:elearning_portal/pages/student/dlm_standard/route.dart';
import 'package:elearning_portal/pages/student/dlm_supplementary/route.dart';
//import 'package:elearning_portal/pages/student/dlm/standard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:elearning_portal/model/userinfo.dart';

import '../../model/stud_dlm.dart';
//import 'dlm.dart';
import 'home.dart';
import 'profile.dart';

class Subject extends StatefulWidget {
  final String id, subcode, grade, subjnam, email, school;
  final UserInfo? userinfo;
  final DLM? dlm;

  const Subject(
      {Key? key,
      required this.id,
      required this.subcode,
      required this.subjnam,
      required this.grade,
      required this.userinfo,
      required this.email,
      required this.school,
      required this.dlm})
      : super(key: key);

  @override
  SubjectState createState() => SubjectState();
}

class SubjectState extends State<Subject> {
  Future<List<UserInfo>>? userinfo;
  final userinfoListKey = GlobalKey<SubjectState>();

  @override
  void initState() {
    super.initState();
    userinfo = getUserInfo();
  }

  Future<List<UserInfo>> getUserInfo() async {
    var url =
        'https://elearningmarikina.ph/web_mobile/API/ver_1.0.0/user_info.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
        "id": widget.id,
      },
    );
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<UserInfo> userinfo = items.map<UserInfo>((json) {
      return UserInfo.fromJson(json);
    }).toList();
    return userinfo;
  }

  // ignore: non_constant_identifier_names
  Future Logout() async {
    var url =
        "https://elearningmarikina.ph/web_mobile/API/ver_1.0.0/sign_out.php";
    var response = await http.post(
      Uri.parse(url),
      body: {
        "id": widget.id,
        "qtr": '1st Quarter, 2nd quarter, 3rd Quarter, 4th Quarter',
        "grd": widget.grade,
      },
    );
    var data = json.decode(response.body);
    if (data == 'Success') {
      Fluttertoast.showToast(
        msg: "Logout Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
    } else {
      Fluttertoast.showToast(
        msg: "Logout Failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      key: userinfoListKey,
      appBar: AppBar(
        toolbarHeight: 60,
        leadingWidth: 25,
        title: Text(
          widget.subjnam,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Student(
              id: widget.id,
              email: widget.email,
              grade: widget.grade,
              school: widget.school,
              subj: null,
              announce: null,
            ),
          ),
        ),
        child: const Icon(Icons.home),
        backgroundColor: Colors.black54,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Builder(
              builder: (context) => SizedBox.fromSize(
                size: const Size(60, 70),
                child: ClipRect(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.blue,
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.menu,
                            color: Colors.black54,
                            size: 30,
                          ),
                          Text(
                            'Menu',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Builder(
              builder: (context) => SizedBox.fromSize(
                size: const Size(80, 70),
                child: ClipRect(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.blue,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(
                            id: widget.id,
                            email: widget.email,
                            grade: widget.grade,
                            school: widget.school,
                            subj: null,
                            announce: null,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.person,
                            color: Colors.black54,
                            size: 30,
                          ),
                          Text(
                            'My Profile',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(0),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              padding: EdgeInsets.zero,
              height: 100,
              width: double.infinity,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Builder(
                  builder: (context) => Text(
                    widget.subjnam,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
              child: ExpansionTile(
                  title: (TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.folder,
                      color: Colors.blueAccent,
                    ),
                    label: const Text('Digitize Learning Materials'),
                  )),
                  children: <Widget>[
                    ListTile(
                      tileColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 40),
                      horizontalTitleGap: 8,
                      minLeadingWidth: 8,
                      title: const Text(
                        'Standard',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      leading: const Icon(Icons.folder),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DLMRoute(
                            id: widget.id,
                            email: widget.email,
                            grade: widget.grade,
                            school: widget.school,
                            subcode: widget.subcode,
                            subjnam: widget.subjnam,
                            userinfo: null,
                            dlm: null,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      tileColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 40),
                      horizontalTitleGap: 8,
                      minLeadingWidth: 8,
                      title: const Text(
                        'Supplementary',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      leading: const Icon(Icons.folder),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DLMRoute2(
                            id: widget.id,
                            email: widget.email,
                            grade: widget.grade,
                            school: widget.school,
                            subcode: widget.subcode,
                            subjnam: widget.subjnam,
                            userinfo: null,
                            dlm: null,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
              child: ExpansionTile(
                  title: (TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.quiz,
                      color: Colors.blueAccent,
                    ),
                    label: const Text('Digitize Learning Materials'),
                  )),
                  children: <Widget>[
                    ListTile(
                        tileColor: Colors.white,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 40),
                        horizontalTitleGap: 8,
                        minLeadingWidth: 8,
                        title: const Text(
                          'Formattive',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        leading: const Icon(Icons.rule),
                        onTap: null),
                    ListTile(
                      tileColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 40),
                      horizontalTitleGap: 8,
                      minLeadingWidth: 8,
                      title: const Text(
                        'Summative',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      leading: const Icon(Icons.rule),
                      onTap: null,
                    ),
                  ]),
            ),
            ////----////
            const Divider(
              height: 0,
              color: Color.fromARGB(255, 217, 217, 217),
            ),

            const Divider(
              height: 0,
              color: Color.fromARGB(255, 217, 217, 217),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
              child: (TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.task,
                  color: Colors.blueAccent,
                ),
                label: const Text('eNote'),
              )),
            ),
            const Divider(
              height: 0,
              color: Color.fromARGB(255, 217, 217, 217),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
              child: (TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.fact_check,
                  color: Colors.blueAccent,
                ),
                label: const Text('Summary'),
              )),
            ),
            const Divider(
              height: 0,
              color: Color.fromARGB(255, 217, 217, 217),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
              child: (TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.quiz,
                  color: Colors.blueAccent,
                ),
                label: const Text('Periodical Exam'),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
