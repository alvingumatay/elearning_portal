/*
Title: DepED Marikina eLearning Program
Author: Rio Conales (rioconales@gmail.com)
Developer: DepED Marikina
Module: 1.0
Date Created: 5-31-2022
*/

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:elearning_portal/model/news.dart';
import 'package:elearning_portal/pages/news/newsarticle.dart';

import 'login.dart';

class Home extends StatefulWidget {
  final News? news;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  Home({this.news});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<List<News>>? news;
  final newsListKey = GlobalKey<HomeState>();

  @override
  void initState() {
    super.initState();
    news = getNewsList();
  }

  Future<List<News>> getNewsList() async {
    var url = 'https://elearningmarikina.ph/web_mobile/API/ver_1.0.0/news.php';
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      key: newsListKey,
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 25,
        title: const Text(
          'SDO Marikina eLearning Program',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.home),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Builder(
              builder: (context) => SizedBox.fromSize(
                size: const Size(60, 70),
                child: ClipRect(
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/history');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.info,
                            color: Colors.black54,
                            size: 30,
                          ),
                          Text(
                            'About Us',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Builder(
              builder: (context) => SizedBox.fromSize(
                size: const Size(60, 70),
                child: ClipRect(
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/directory');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.event_note,
                            color: Colors.black54,
                            size: 30,
                          ),
                          Text(
                            'Directory',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Builder(
              builder: (context) => SizedBox.fromSize(
                size: const Size(60, 70),
                child: ClipRect(
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/twg');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.groups,
                            color: Colors.black54,
                            size: 30,
                          ),
                          Text(
                            'TWG',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Builder(
              builder: (context) => SizedBox.fromSize(
                size: const Size(60, 70),
                child: ClipRect(
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/newsarchieve');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.article,
                            color: Colors.black54,
                            size: 30,
                          ),
                          Text(
                            'News',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(children: <Widget>[
        Container(
          padding: EdgeInsets.zero,
          child: Image.asset(
            'lib/assets/images/Banner.png',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          color: Colors.white,
          child: ElevatedButton(
            child: const Text(
              'Get Started...',
              style: TextStyle(fontSize: 15),
            ),
            onPressed: () {
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => Login(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.zero,
          height: 10,
          color: Colors.grey[300],
        ),
        Container(
          padding: const EdgeInsets.all(0),
          color: Colors.white,
          child: ListTile(
            contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            title: const Text(
              'Latest News',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/newsarchieve');
              },
              child: const Text(
                'View More...',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ),
        const Divider(
          height: 0,
          color: Colors.grey,
        ),
        Container(
          constraints: const BoxConstraints(
            maxHeight: 400,
          ),
          padding: EdgeInsets.zero,
          color: Colors.white,
          child: FutureBuilder<List<News>>(
            future: news,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox(
                  height: 50,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                    ),
                  ),
                );
              } else {
                return PageView.builder(
                  itemCount:
                      snapshot.data.length < 3 ? snapshot.data.length : 3,
                  itemBuilder: (BuildContext context, int index) {
                    var getdata = snapshot.data![index];
                    var pic = getdata.pic;
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              getdata.dateposted,
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
                                    'https://www.elearningmarikina.ph/web_mobile/images/news/thumbnails/$pic',
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
                                          getdata.newstitle,
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
                              getdata.author,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              getdata.newscontent,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.zero,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  NewsArticle(news: getdata)));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child: const Text(
                                      'Read More...',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ]);
                  },
                );
              }
            },
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.zero,
          height: 10,
          color: Colors.grey[300],
        ),
        Container(
          padding: const EdgeInsets.all(0),
          color: Colors.white,
          child: const ListTile(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            title: Text(
              'Continuous Advocacy Campaign and Enrollment',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Divider(
          height: 0,
          color: Colors.grey,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          width: double.infinity,
          child: const Text(
            'The Division Office conducts continuous advocacy campaigns and programs to disseminate the information to the field and at the same time to attract future enrollees. The two implementing schools post tarpaulins of the eLearning program at their facade. The class advisers discuss the program to the parents during Parents - Teachers Conference (PTC) or in any event or activity of the school if given a chance.This is to sustain the enrollment and to ensure maximum participation of the stakeholders for the success of the eLearning program.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          color: Colors.white,
          width: double.infinity,
          child: const Text(
            'The administrators are looking for partners who believe in the project and who can help support the financial need of the program.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
          color: Colors.white,
          width: double.infinity,
          child: const Text(
            'This Office is looking forward to implement this program up to Senior High School.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.zero,
          height: 10,
          color: Colors.grey[300],
        ),
        Container(
          padding: const EdgeInsets.all(0),
          color: Colors.white,
          child: const ListTile(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            title: Text(
              'Project Benefits',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Divider(
          height: 0,
          color: Colors.grey,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
          color: Colors.white,
          width: double.infinity,
          child: const Text(
            'The eLearning program:',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),
          tileColor: Colors.white,
          minLeadingWidth: 8,
          leading: Icon(
            Icons.circle,
            size: 8,
          ),
          title: Text(
            'provides learning opportunities to teachers and learners “anytime”, “anywhere”.',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),
          tileColor: Colors.white,
          minLeadingWidth: 8,
          leading: Icon(
            Icons.circle,
            size: 8,
          ),
          title: Text(
            'prepares teachers and learners for the knowledge-based economy.',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),
          tileColor: Colors.white,
          minLeadingWidth: 8,
          leading: Icon(
            Icons.circle,
            size: 8,
          ),
          title: Text(
            'offers opportunities to teachers and learners to indulge in ICT integration in the teaching and learning process.',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),
          tileColor: Colors.white,
          minLeadingWidth: 8,
          leading: Icon(
            Icons.circle,
            size: 8,
          ),
          title: Text(
            'allows teachers and learners to cope with the fast-changing technology.',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),
          tileColor: Colors.white,
          minLeadingWidth: 8,
          leading: Icon(
            Icons.circle,
            size: 8,
          ),
          title: Text(
            'equips teachers with the necessary knowledge and skills in ICT.',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 10),
          tileColor: Colors.white,
          minLeadingWidth: 8,
          leading: Icon(
            Icons.circle,
            size: 8,
          ),
          title: Text(
            'helps students to save money, time and effort in going to school.',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.zero,
          height: 10,
          color: Colors.grey[300],
        ),
        Container(
          padding: const EdgeInsets.all(0),
          color: Colors.white,
          child: const ListTile(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            title: Text(
              'Admission',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Divider(
          height: 0,
          color: Colors.grey,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
          color: Colors.white,
          width: double.infinity,
          child: const Text(
            'eLearning Enrollment Process',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),
          tileColor: Colors.white,
          minLeadingWidth: 8,
          leading: Icon(
            Icons.circle,
            size: 8,
          ),
          title: Text(
            'Fill out application form',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),
          tileColor: Colors.white,
          minLeadingWidth: 8,
          leading: Icon(
            Icons.circle,
            size: 8,
          ),
          title: Text(
            'Entrance examination',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),
          tileColor: Colors.white,
          minLeadingWidth: 8,
          leading: Icon(
            Icons.circle,
            size: 8,
          ),
          title: Text(
            'Interview',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),
          tileColor: Colors.white,
          minLeadingWidth: 8,
          leading: Icon(
            Icons.circle,
            size: 8,
          ),
          title: Text(
            'Final enlistment',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.zero,
          height: 10,
          color: Colors.grey[300],
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child: const ListTile(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            tileColor: Colors.white,
            title: Text(
              'Qualification and Retention',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Divider(
          height: 0,
          color: Colors.grey,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
          color: Colors.white,
          width: double.infinity,
          child: const Text(
            'Jesus Dela Peña National High School',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),
          tileColor: Colors.white,
          minLeadingWidth: 8,
          leading: Icon(
            Icons.circle,
            size: 8,
          ),
          title: Text(
            'With at least 80% general average',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
          color: Colors.white,
          width: double.infinity,
          child: const Text(
            'Marikina Science High School',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),
          tileColor: Colors.white,
          minLeadingWidth: 8,
          leading: Icon(
            Icons.circle,
            size: 8,
          ),
          title: Text(
            'Passed the admission test',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),
          tileColor: Colors.white,
          minLeadingWidth: 8,
          leading: Icon(
            Icons.circle,
            size: 8,
          ),
          title: Text(
            'With at least 85% general average',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 15, 10, 10),
          color: Colors.white,
          width: double.infinity,
          child: const Text(
            'Guidelines on Retention',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),
          tileColor: Colors.white,
          minLeadingWidth: 8,
          leading: Icon(
            Icons.circle,
            size: 8,
          ),
          title: Text(
            'Maintain an average grade of 85%',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),
          tileColor: Colors.white,
          minLeadingWidth: 8,
          leading: Icon(
            Icons.circle,
            size: 8,
          ),
          title: Text(
            'With at least 83% of grade for add-ons',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.zero,
          height: 10,
          color: Colors.grey[300],
        ),
        Container(
          color: Colors.white,
          height: 50,
        ),
      ]),
    );
  }
}
