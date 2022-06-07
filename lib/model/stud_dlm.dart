/*
Title: DepED Marikina eLearning Program
Author: Rio Conales (rioconales@gmail.com)
Developer: DepED Marikina
Module: 1.0
Date Created: 5-31-2022
*/

class DLM {
  final String lid;
  final String ftype;
  final String grade;
  final String subjct;
  final String qtr;
  final String ltitle;
  final String url;

  DLM(
      {required this.lid,
      required this.ftype,
      required this.grade,
      required this.ltitle,
      required this.subjct,
      required this.qtr,
      required this.url});

  factory DLM.fromJson(Map<String, dynamic> json) {
    return DLM(
      lid: json['lid'],
      ftype: json['ftype'],
      grade: json['grade'],
      ltitle: json['ltitle'],
      subjct: json['subjct'],
      qtr: json['qtr'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'ftype': ftype,
        'grade': grade,
        'ltitle': ltitle,
        'subjct': subjct,
        'qtr': qtr,
        'url': url,
      };
}
