/*
Title: DepED Marikina eLearning Program
Author: Rio Conales (rioconales@gmail.com)
Developer: DepED Marikina
Module: 1.0
Date Created: 5-31-2022
*/

// ignore_for_file: use_key_in_widget_constructors

//import 'package:elearning_portal/pages/student/dlm/standard.dart';
//import 'package:elearning_portal/pages/student/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:elearning_portal/model/stud_dlm.dart';

import '../../../model/userinfo.dart';

class SQDLM extends StatefulWidget {
  final String id, subcode, grade, subjnam, email, school;
  final UserInfo? userinfo;
  final DLM? dlm;
  const SQDLM(
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
  SQDLMState createState() => SQDLMState();
}

class SQDLMState extends State<SQDLM> {
  Future<List<DLM>>? dlm;
  final dlmListKey = GlobalKey<SQDLMState>();

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
        "qtr": '2nd Quarter',
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
    );
  }
}
