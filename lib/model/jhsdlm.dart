/*
Title: DepED Marikina eLearning Program
Author: Rio Conales (rioconales@gmail.com)
Developer: DepED Marikina
Module: 1.0
Date Created: 5-31-2022
*/

class JHSLesson {
  final String lid;

  final String file;

  JHSLesson({required this.lid, required this.file});

  factory JHSLesson.fromJson(Map<String, dynamic> json) {
    return JHSLesson(
      lid: json['lid'],
      file: json['file'],
    );
  }

  Map<String, dynamic> toJson() => {
        'lid': lid,
        'file': file,
      };
}
