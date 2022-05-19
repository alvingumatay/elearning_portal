// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:elearning_portal/model/news.dart';
import 'package:elearning_portal/pages/newsarticle.dart';

class NewsArchieve extends StatefulWidget {
  @override
  NewsArchieveState createState() => NewsArchieveState();
}

class NewsArchieveState extends State<NewsArchieve> {
  Future<List<News>>? news;
  final newsListKey = GlobalKey<NewsArchieveState>();

  @override
  void initState() {
    super.initState();
    news = getNewsList();
  }

  Future<List<News>> getNewsList() async {
    var url = 'https://elearningmarikina.ph/Apps/news.php';
    http.Response response = await http.get(Uri.parse(url));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<News> news = items.map<News>((json) {
      return News.fromJson(json);
    }).toList();

    return news;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: newsListKey,
      appBar: AppBar(
        leadingWidth: 25,
        title: const Text(
          'News Archieves',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<News>>(
          future: news,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = snapshot.data![index];
                  var pic = data.pic;
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            data.dateposted,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.network(
                                  'https://www.elearningmarikina.ph/Apps/images/$pic',
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data.newstitle,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Text(
                            data.author,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Text(
                            data.newscontent,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(children: const [
                                  Text(
                                    '75 Likes',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ]),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(children: const [
                                  Text(
                                    '68 Comments',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ]),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(children: const [
                                  Text(
                                    '105 Views',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ]),
                              ),
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: const Divider(
                            height: 5,
                            color: Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.thumb_up,
                                  size: 20,
                                  color: Color.fromARGB(255, 78, 140, 191),
                                ),
                                label: const Text(
                                  'Like',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 78, 140, 191),
                                  ),
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.comment,
                                  size: 20,
                                  color: Color.fromARGB(255, 78, 140, 191),
                                ),
                                label: const Text(
                                  'Comment',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 78, 140, 191),
                                  ),
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NewsArticle(news: data)));
                                },
                                icon: const Icon(
                                  Icons.visibility,
                                  size: 20,
                                  color: Color.fromARGB(255, 78, 140, 191),
                                ),
                                label: const Text(
                                  'View',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 78, 140, 191),
                                  ),
                                ),
                              ),
                            ]),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.zero,
                          height: 10,
                          color: Colors.grey[300],
                        ),
                      ]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
