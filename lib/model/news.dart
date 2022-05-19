class News {
  final String nid;
  final String newstitle;
  final String author;
  final String newscontent;
  final String dateposted;
  final String? pic;

  News(
      {required this.nid,
      required this.newstitle,
      required this.author,
      required this.newscontent,
      required this.dateposted,
      required this.pic});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      nid: json['nid'],
      newstitle: json['newstitle'],
      author: json['author'],
      newscontent: json['newscontent'],
      dateposted: json['dateposted'],
      pic: json['pic'],
    );
  }

  Map<String, dynamic> toJson() => {
        'newstitle': newstitle,
        'author': author,
        'newscontent': newscontent,
        'dateposted': dateposted,
        'name': pic,
      };
}
