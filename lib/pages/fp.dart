/*
Title: DepED Marikina eLearning Program
Author: Rio Conales (rioconales@gmail.com)
Developer: DepED Marikina
Module: 1.0
Date Created: 5-31-2022
*/
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/sign_in.dart';
import 'confirm_fp.dart';
import 'home.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class Forgot extends StatefulWidget {
  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  Future<List<User>>? user;
  bool visible = false;

  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  // ignore: non_constant_identifier_names
  Future Forgot() async {
    setState(() {
      visible = true;
    });

    var url = "https://elearningmarikina.ph/web_mobile/API/ver_1.0.0/fp.php";
    var response = await http.post(
      Uri.parse(url),
      body: {
        "email": emailController.text,
      },
    );
    var data = json.decode(response.body);

    if (data == 'Success') {
      setState(() {
        visible = false;
      });
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const ConfirmFP(),
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Sending Request Failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      setState(() {
        visible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 25,
        title: const Text(
          'SDO Marikina eLearning Program',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => Home(),
            ),
          );
        },
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
            IconButton(
              icon: const Icon(Icons.info),
              color: Colors.black54,
              iconSize: 35,
              onPressed: () {
                Navigator.pushNamed(context, '/history');
              },
            ),
            IconButton(
              icon: const Icon(Icons.event_note),
              color: Colors.black54,
              iconSize: 35,
              onPressed: () {
                Navigator.pushNamed(context, '/directory');
              },
            ),
            const SizedBox(
              width: 50,
            ),
            IconButton(
              icon: const Icon(Icons.groups),
              color: Colors.black54,
              iconSize: 35,
              onPressed: () {
                Navigator.pushNamed(context, '/twg');
              },
            ),
            IconButton(
              icon: const Icon(Icons.article),
              color: Colors.black54,
              iconSize: 35,
              onPressed: () {
                Navigator.pushNamed(context, '/newsarchieve');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
              child: const Icon(
                Icons.security,
                color: Colors.blue,
                size: 50,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: const Text(
                'Forgot Password',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Container(
              height: 75,
              width: 350,
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: 300,
              height: 70,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: const Text('Submit'),
                onPressed: () {
                  Forgot();
                },
              ),
            ),
            Visibility(
              visible: visible,
              child: Container(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                margin: const EdgeInsets.only(bottom: 30),
                child: const LinearProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
