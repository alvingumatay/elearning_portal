class Announcement{
  final String anounceid;
  final String school;
  final String title;
  final String? message;
  final String buwan;
  final String araw;
  final String taon;

  Announcement({
    required this.anounceid,
    required this.school,
    required this.title,
    required this.message,
    required this.buwan,
    required this.araw,
    required this.taon
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      anounceid: json['anounceid'],
      school: json['school'],
      title: json['title'],
      message: json['message'],
      buwan: json['buwan'],
      araw: json['araw'],
      taon: json['taon']
    );
  }

   Map<String, dynamic> toJson() => {
        'anounceid': anounceid,
        'school': school,
        'title': title,
        'message': message,
        'buwan': buwan,
        'araw': araw,
        'taon': taon
      };

}