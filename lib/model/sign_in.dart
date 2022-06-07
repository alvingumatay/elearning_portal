/*
Title: DepED Marikina eLearning Program
Author: Rio Conales (rioconales@gmail.com)
Developer: DepED Marikina
Module: 1.0
Date Created: 5-31-2022
*/
class User {
  final String id;
  final String email;
  final String password;
  final String status;
  final String school;
  final String grade;
  final String section;
  User(
      {required this.id,
      required this.email,
      required this.password,
      required this.status,
      required this.school,
      required this.grade,
      required this.section});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      status: json['status'],
      school: json['school'],
      grade: json['grade'],
      section: json['section'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'status': status,
        'school': school,
        'grade': grade,
        'section': section,
      };
}
