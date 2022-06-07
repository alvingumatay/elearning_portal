/*
Title: DepED Marikina eLearning Program
Author: Rio Conales (rioconales@gmail.com)
Developer: DepED Marikina
Module: 1.0
Date Created: 5-31-2022
*/

class SchoolDirct {
  final String? id;
  final String school;
  final String phone;
  final String? sl;

  SchoolDirct(
      {required this.id,
      required this.school,
      required this.phone,
      required this.sl});

  factory SchoolDirct.fromJson(Map<String, dynamic> json) {
    return SchoolDirct(
      id: json['id'],
      school: json['school'],
      phone: json['phone'],
      sl: json['sl'],
    );
  }

  Map<String, dynamic> toJson() => {
        'school': school,
        'phone': phone,
        'sl': sl,
      };
}
