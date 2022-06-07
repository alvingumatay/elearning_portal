/*
Title: DepED Marikina eLearning Program
Author: Rio Conales (rioconales@gmail.com)
Developer: DepED Marikina
Module: 1.0
Date Created: 5-31-2022
*/

class SubArea {
  final String id, subcode, subjnam, classnam, grade;

  SubArea({
    required this.id,
    required this.subcode,
    required this.subjnam,
    required this.classnam,
    required this.grade,
  });

  factory SubArea.fromJson(Map<String, dynamic> json) {
    return SubArea(
        id: json['id'],
        subcode: json['subcode'],
        subjnam: json['subjnam'],
        classnam: json['class_nam'],
        grade: json['grade']);
  }

  Map<String, dynamic> toJson() => {
        'subcode': subcode,
        'subjnam': subjnam,
        'class_nam': classnam,
        'grade': grade,
      };
}
