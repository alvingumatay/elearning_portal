// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:elearning_portal/model/news.dart';

class NewsArticle extends StatefulWidget {
  final News? news;

  NewsArticle({this.news});

  @override
  _NewsArticleState createState() => _NewsArticleState();
}

class _NewsArticleState extends State<NewsArticle> {
  @override
  Widget build(BuildContext context) {
    widget.news!.nid.toString();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 25,
        title: const Text(
          'News Article',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            widget.news!.dateposted,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            widget.news!.newstitle,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.blue,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Image.network(
            'https://www.elearningmarikina.ph/Apps/images/${widget.news!.pic}',
            fit: BoxFit.fitHeight,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            widget.news!.author,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            widget.news!.newscontent,
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
            ]),
      ]),
    );
  }
}
