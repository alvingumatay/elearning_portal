// ignore_for_file: use_key_in_widget_constructors

/*
Title: DepED Marikina eLearning Program
Author: Rio Conales (rioconales@gmail.com)
Developer: DepED Marikina
Module: 1.0
Date Created: 5-31-2022
*/

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:elearning_portal/model/userinfo.dart';

import '../../model/admin_post.dart';
import '../../model/subjarea.dart';
import 'home.dart';

class Profile extends StatefulWidget {
  final String id, email, grade, school;
  final SubArea? subj;
  final Announcement? announce;
  const Profile({
    Key? key,
    required this.id,
    required this.email,
    required this.grade,
    required this.school,
    required this.subj,
    required this.announce,
  }) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  Future<List<UserInfo>>? userinfo;
  final userinfoListKey = GlobalKey<ProfileState>();

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
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Logout();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.power_settings_new,
                            color: Colors.black54,
                            size: 30,
                          ),
                          Text(
                            'Log Out',
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.person,
                            color: Colors.blue,
                            size: 30,
                          ),
                          Text(
                            'My Profile',
                            style: TextStyle(
                              color: Colors.blue,
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
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  padding: EdgeInsets.zero,
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Icons.person_rounded,
                    size: 75,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.zero,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder<List<UserInfo>>(
                future: userinfo,
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
                            title: Text(
                              data.firstnam +
                                  " " +
                                  data.mi +
                                  " " +
                                  data.lastnam,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            ),
                            subtitle: Text(
                              data.email,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                          ),
                          const Divider(
                            height: 1,
                            color: Color.fromARGB(255, 217, 217, 217),
                          ),
                          ListTile(
                            dense: true,
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -4),
                            contentPadding: const EdgeInsets.all(10),
                            title: Text(
                              data.grade + " " + " " + data.section,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                            subtitle: Text(
                              data.school,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
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
