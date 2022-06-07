/*
Title: DepED Marikina eLearning Program
Author: Rio Conales (rioconales@gmail.com)
Developer: DepED Marikina
Module: 1.0
Date Created: 5-31-2022
*/

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:elearning_portal/model/stud_dlm.dart';

import '../../model/userinfo.dart';
import 'home.dart';

class StudDLM extends StatefulWidget {
  final String id, subcode, grade, subjnam, email, school;
  final UserInfo? userinfo;
  final DLM? dlm;
  const StudDLM(
      {Key? key,
      required this.id,
      required this.subcode,
      required this.subjnam,
      required this.grade,
      required this.userinfo,
      required this.dlm,
      required this.email,
      required this.school})
      : super(key: key);
  @override
  StudDLMState createState() => StudDLMState();
}

class StudDLMState extends State<StudDLM> {
  Future<List<DLM>>? dlm;
  final dlmListKey = GlobalKey<StudDLMState>();

  @override
  void initState() {
    super.initState();
    dlm = getDLMList();
  }

  Future<List<DLM>> getDLMList() async {
    var url =
        'https://elearningmarikina.ph/web_mobile/API/ver_1.0.0/q1_dlm.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
        "subcode": widget.subcode,
        "qtr": '1st Quarter',
        "grd": widget.grade,
      },
    );
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<DLM> dlm = items.map<DLM>((json) {
      return DLM.fromJson(json);
    }).toList();
    return dlm;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      key: dlmListKey,
      appBar: AppBar(
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
                      // onTap: () => Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Profile(
                      //       id: widget.id,
                      //       email: widget.email,
                      //       school: widget.school,
                      //       subj: null,
                      //       announce: null,
                      //     ),
                      //   ),
                      // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.analytics,
                            color: Colors.black54,
                            size: 30,
                          ),
                          Text(
                            'My Progress',
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
        child: FutureBuilder<List<DLM>>(
          future: dlm,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox(
                height: 50,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                  ),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot.data![index];
                    return Row(children: [
                      Expanded(
                        flex: 3,
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          minLeadingWidth: 8,
                          leading: const Icon(
                            Icons.description,
                            color: Colors.blue,
                          ),
                          title: Text(
                            data.ltitle + "-" + data.grade,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black54),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          title: Text(
                            data.ftype,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black54),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: const Icon(
                            Icons.visibility,
                            color: Colors.blue,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: const Icon(
                            Icons.download,
                            color: Colors.blue,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ]);
                  });
            }
          },
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
              padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
              child: (TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.folder,
                  color: Colors.blueAccent,
                ),
                label: const Text('Digitize Learning Materials'),
              )),
            ),
            ListTile(
              tileColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 40),
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
                  builder: (context) => StudDLM(
                    id: widget.id,
                    email: widget.email,
                    school: widget.school,
                    grade: widget.grade,
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 40),
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
              onTap: () {},
            ),
            const Divider(
              height: 0,
              color: Color.fromARGB(255, 217, 217, 217),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
              child: (TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.quiz,
                  color: Colors.blueAccent,
                ),
                label: const Text('Assessment'),
              )),
            ),
            ListTile(
              tileColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 40),
              horizontalTitleGap: 8,
              minLeadingWidth: 8,
              title: const Text(
                'Formative',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                ),
              ),
              leading: const Icon(Icons.rule),
              onTap: () {},
            ),
            ListTile(
              tileColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 40),
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
              onTap: () {},
            ),
            const Divider(
              height: 0,
              color: Color.fromARGB(255, 217, 217, 217),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
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
              padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
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
              padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
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
