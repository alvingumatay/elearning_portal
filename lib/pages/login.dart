import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:elearning_portal/model/user.dart';
import 'package:elearning_portal/widget/loginform.dart';

class Login extends StatefulWidget {
  final User? user;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  Login({this.user});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future _userLogin() async {
    return await http.post(
      Uri.parse("https://elearningmarikina.ph/Apps/user.php"),
      body: {
        "email": emailController.text,
        "password": passwordController.text,
      },
    );
  }

  void _onConfirm(context) async {
    await _userLogin();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 25,
        title: const Text(
          'SDO Marikina eLearning Program',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppForm(
              formKey: formKey,
              emailController: emailController,
              passwordController: passwordController,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: 250,
              height: 70,
              child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: const Text('Forgot Password?'),
                onPressed: () {},
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
                child: const Text('LOG IN'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    _onConfirm(context);
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
