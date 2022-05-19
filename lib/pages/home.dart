// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:elearning_portal/model/news.dart';
import 'package:elearning_portal/pages/newsarticle.dart';

class Home extends StatefulWidget {
  final News? news;
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

  Future likeNews() async {
    await http.post(
        (Uri.parse("https://elearningmarikina.ph/Apps/likenews.php")),
        body: {
          'nid': widget.news!.nid.toString(),
        });
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
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
          'SDO Marikina eLearning Program',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          tileColor: Color.fromARGB(255, 235, 235, 235),
          title: Text(
            '© 2022 Schools Division Office - Marikina City. All Rights Reserved.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ),
      ),
      body: ListView(children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: EdgeInsets.zero,
            child: Image.asset(
              'lib/assets/Banner.png',
              fit: BoxFit.fitWidth,
            ),
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
              Navigator.pushNamed(context, '/login');
            },
            style: ElevatedButton.styleFrom(
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
              child: const Text('More...'),
            ),
          ),
        ),
        const Divider(
          height: 5,
          color: Color.fromARGB(255, 217, 217, 217),
        ),
        Container(
          constraints: const BoxConstraints(
            maxHeight: 350,
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
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                                  onPressed: () => likeNews(),
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
                                                NewsArticle(news: getdata)));
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
          height: 5,
          color: Color.fromARGB(255, 217, 217, 217),
        ),
        Container(
          padding: const EdgeInsets.all(10),
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
          height: 5,
          color: Color.fromARGB(255, 217, 217, 217),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
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
          height: 5,
          color: Color.fromARGB(255, 217, 217, 217),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
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
          height: 5,
          color: Color.fromARGB(255, 217, 217, 217),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
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
      ]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 100,
              width: double.infinity,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
              child: (TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.info,
                  color: Colors.blueAccent,
                ),
                label: const Text('About Us'),
              )),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 40),
              horizontalTitleGap: 8,
              minLeadingWidth: 8,
              title: const Text(
                'History',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                ),
              ),
              leading: const Icon(Icons.history),
              onTap: () {
                Navigator.pushNamed(context, '/history');
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 40),
              horizontalTitleGap: 8,
              minLeadingWidth: 8,
              title: const Text(
                'eTeachers',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                ),
              ),
              leading: const Icon(Icons.groups),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 40),
              horizontalTitleGap: 8,
              minLeadingWidth: 8,
              title: const Text(
                'Facilities',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                ),
              ),
              leading: const Icon(Icons.room_preferences),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 40),
              horizontalTitleGap: 8,
              minLeadingWidth: 8,
              title: const Text(
                'eLearning Structure',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                ),
              ),
              leading: const Icon(Icons.schema),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 40),
              horizontalTitleGap: 8,
              minLeadingWidth: 8,
              title: const Text(
                'Technical Working Group',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                ),
              ),
              leading: const Icon(Icons.groups),
              onTap: () {
                Navigator.pushNamed(context, '/twg');
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 40),
              horizontalTitleGap: 8,
              minLeadingWidth: 8,
              title: const Text(
                'Vision, Mission, Core Values and Mandates',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                ),
              ),
              leading: const Icon(Icons.emoji_objects),
              onTap: () {
                Navigator.pushNamed(context, '/vmcm');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              height: 5,
              color: Color.fromARGB(255, 217, 217, 217),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
              child: (TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/directory');
                },
                icon: const Icon(
                  Icons.phone,
                  color: Colors.blueAccent,
                ),
                label: const Text('Schools Directory'),
              )),
            ),
            const Divider(
              height: 5,
              color: Color.fromARGB(255, 217, 217, 217),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
              child: (TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/other_resources');
                },
                icon: const Icon(
                  Icons.folder,
                  color: Colors.blueAccent,
                ),
                label: const Text('Other Resources'),
              )),
            ),
            const Divider(
              height: 5,
              color: Color.fromARGB(255, 217, 217, 217),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
              child: (TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/newsarchieve');
                },
                icon: const Icon(
                  Icons.archive,
                  color: Colors.blueAccent,
                ),
                label: const Text('News Archieves'),
              )),
            ),
            const Divider(
              height: 5,
              color: Color.fromARGB(255, 217, 217, 217),
            ),
          ],
        ),
      ),
    );
  }
}
