/*
Title: DepED Marikina eLearning Program
Author: Rio Conales (rioconales@gmail.com) and Esmeraldo Marin (esmeraldomarinjr@gmail.com)
Developer: DepED Marikina
Module: 1.0
Date Created: 5-31-2022
*/

import 'package:elearning_portal/pages/student/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:elearning_portal/model/subjarea.dart';

import '../../model/admin_post.dart';
import 'subject.dart';

class Student extends StatefulWidget {
  final String id, email, grade, school;
  final SubArea? subj;
  final Announcement? announce;
  const Student(
      {Key? key,
      required this.id,
      required this.email,
      required this.grade,
      required this.school,
      required this.subj,
      required this.announce})
      : super(key: key);
  @override
  StudentState createState() => StudentState();
}

class StudentState extends State<Student> {
  String email = "";
  Future<List<SubArea>>? subj;
  Future<List<Announcement>>? announce;

  final subjListKey = GlobalKey<StudentState>();
  @override
  void initState() {
    super.initState();
    subj = getSujLoad();
    announce = getAnnouncement();
  }

  Future<List<Announcement>> getAnnouncement() async {
    var url =
        'https://elearningmarikina.ph/web_mobile/API/ver_1.0.0/announce.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
        "school": widget.school,
      },
    );
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Announcement> announce = items.map<Announcement>((json) {
      return Announcement.fromJson(json);
    }).toList();
    return announce;
  }

  Future<List<SubArea>> getSujLoad() async {
    var url =
        'https://elearningmarikina.ph/web_mobile/API/ver_1.0.0/subj_area.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
        "id": widget.id,
      },
    );
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<SubArea> subj = items.map<SubArea>((json) {
      return SubArea.fromJson(json);
    }).toList();
    return subj;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      key: subjListKey,
      appBar: AppBar(
        leadingWidth: 25,
        title: const Text(
          'Subject Area',
          style: TextStyle(fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.home),
        backgroundColor: Colors.blue,
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
                    color: Colors.white,
                    child: InkWell(
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
                              fontSize: 12,
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
                    color: Colors.white,
                    child: InkWell(
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
                              fontSize: 12,
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
        child: FutureBuilder<List<Announcement>>(
          future: announce,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = snapshot.data![index];

                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            data.buwan + ' ' + data.araw + ', ' + data.taon,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            data.title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Html(data: data.message),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.zero,
                          height: 10,
                          color: Colors.grey[300],
                        ),
                      ]);
                },
              );
            }
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.zero,
              height: 60,
              width: double.infinity,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Subject Area',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.zero,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder<List<SubArea>>(
                future: subj,
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
                        return Column(children: [
                          ListTile(
                            dense: true,
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -4),
                            contentPadding: const EdgeInsets.all(10),
                            minLeadingWidth: 8,
                            leading: const Icon(
                              Icons.menu_book,
                              color: Colors.blue,
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Subject(
                                  id: widget.id,
                                  email: widget.email,
                                  grade: widget.grade,
                                  school: widget.school,
                                  subcode: data.subcode,
                                  subjnam: data.subjnam,
                                  userinfo: null,
                                  dlm: null,
                                ),
                              ),
                            ),
                            title: Text(
                              data.subjnam,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                          ),
                          const Divider(
                            height: 1,
                            color: Color.fromARGB(255, 217, 217, 217),
                          ),
                        ]);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
