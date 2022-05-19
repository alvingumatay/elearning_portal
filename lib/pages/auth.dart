// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:elearning_portal/model/user.dart';

class Auth extends StatefulWidget {
  @override
  AuthState createState() => AuthState();
}

class AuthState extends State<Auth> {
  Future<List<User>>? user;
  final userListKey = GlobalKey<AuthState>();

  @override
  void initState() {
    super.initState();
    user = getStudentList();
  }

  Future<List<User>> getStudentList() async {
    var url = 'https://elearningmarikina.ph/Apps/user.php';
    http.Response response = await http.get(Uri.parse(url));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<User> user = items.map<User>((json) {
      return User.fromJson(json);
    }).toList();

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: userListKey,
      appBar: AppBar(
        title: const Text('SDO Marikina eLearning Program'),
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: user,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = snapshot.data![index];
                  return Card(
                    child: ListTile(
                      minLeadingWidth: 8,
                      title: Text(
                        data.email,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
