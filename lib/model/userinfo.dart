/*
Title: DepED Marikina eLearning Program
Author: Rio Conales (rioconales@gmail.com)
Developer: DepED Marikina
Module: 1.0
Date Created: 5-31-2022
*/
class UserInfo {
  final String id;
  final String email;
  final String school;
  final String section;
  final String grade;
  final String lastnam;
  final String firstnam;
  final String mi;
  final String gender;
  UserInfo(
      {required this.id,
      required this.email,
      required this.school,
      required this.section,
      required this.grade,
      required this.lastnam,
      required this.firstnam,
      required this.mi,
      required this.gender});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      email: json['email'],
      school: json['school'],
      section: json['section'],
      grade: json['grade'],
      lastnam: json['last_nam'],
      firstnam: json['first_nam'],
      mi: json['mi'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'school': school,
        'section': section,
        'grade': grade,
        'lastnam': lastnam,
        'firstnam': firstnam,
        'mi': mi,
        'gender': gender,
      };
}
