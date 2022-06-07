import 'package:elearning_portal/pages/student/dlm_standard/fqdlm.dart';
import 'package:elearning_portal/pages/student/dlm_standard/frtqdlm.dart';
import 'package:elearning_portal/pages/student/dlm_standard/route.dart';
import 'package:elearning_portal/pages/student/dlm_standard/sqdlm.dart';
import 'package:elearning_portal/pages/student/dlm_standard/tqdlm.dart';
import 'package:elearning_portal/pages/student/home.dart';
//;
import 'package:flutter/material.dart';
import 'package:elearning_portal/model/userinfo.dart';

import '../../../model/stud_dlm.dart';

class DLMRoute2 extends StatefulWidget {
  final String id, subcode, grade, subjnam, email, school;
  final UserInfo? userinfo;
  final DLM? dlm;

  const DLMRoute2(
      {Key? key,
      required this.id,
      required this.subcode,
      required this.subjnam,
      required this.grade,
      required this.userinfo,
      required this.email,
      required this.school,
      required this.dlm})
      : super(key: key);

  @override
  State<DLMRoute2> createState() => _DLMRoute2State();
}

class _DLMRoute2State extends State<DLMRoute2> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 25,
            title: Text('DLM STANDARD'),
            centerTitle: true,
            bottom: PreferredSize(
                child: Container(
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.white,
                      labelColor: Colors.white,
                      indicatorWeight: 2,
                      indicator: BoxDecoration(
                        color: Colors.blue,
                      ),
                      tabs: [
                        new Container(
                          width: 100,
                          child: new Tab(text: '1st Quarter'),
                        ),
                        new Container(
                          width: 100,
                          child: new Tab(text: '2nd Quarter'),
                        ),
                        new Container(
                          width: 100,
                          child: new Tab(text: '3rd Quarter'),
                        ),
                        new Container(
                          width: 100,
                          child: new Tab(text: '4th Quarter'),
                        )
                      ]),
                ),
                preferredSize: Size.fromHeight(30.0)),
          ),
          body: TabBarView(children: [
            FQDLM(
              id: widget.id,
              email: widget.email,
              grade: widget.grade,
              school: widget.school,
              subcode: widget.subcode,
              subjnam: widget.subjnam,
              userinfo: null,
              dlm: null,
            ),
            SQDLM(
              id: widget.id,
              email: widget.email,
              grade: widget.grade,
              school: widget.school,
              subcode: widget.subcode,
              subjnam: widget.subjnam,
              userinfo: null,
              dlm: null,
            ),
            TQDLM(
              id: widget.id,
              email: widget.email,
              grade: widget.grade,
              school: widget.school,
              subcode: widget.subcode,
              subjnam: widget.subjnam,
              userinfo: null,
              dlm: null,
            ),
            FRTQDLM(
              id: widget.id,
              email: widget.email,
              grade: widget.grade,
              school: widget.school,
              subcode: widget.subcode,
              subjnam: widget.subjnam,
              userinfo: null,
              dlm: null,
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Student(
                  id: widget.id,
                  email: widget.email,
                  grade: widget.grade,
                  school: widget.school,
                  subj: null,
                  announce: null,
                ),
              ),
            ),
            child: const Icon(Icons.home),
            backgroundColor: Colors.black54,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.blue,
                          onTap: () => Scaffold.of(context).openDrawer(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                Icons.menu,
                                color: Colors.black54,
                                size: 30,
                              ),
                              Text(
                                'Menu',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
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
                  width: 50,
                ),
                Builder(
                  builder: (context) => SizedBox.fromSize(
                    size: const Size(80, 70),
                    child: ClipRect(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.blue,
                          // onTap: () => Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Profile(
                          //       id: widget.id,
                          //       email: widget.email,
                          //       school: widget.school,
                          //       subj: null,
                          //       announce: null,
                          //     ),
                          //   ),
                          // ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                Icons.analytics,
                                color: Colors.black54,
                                size: 30,
                              ),
                              Text(
                                'My Progress',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
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
          drawer: Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.zero,
                  height: 100,
                  width: double.infinity,
                  child: DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Builder(
                      builder: (context) => Text(
                        widget.subjnam,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: ExpansionTile(
                      title: (TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.folder,
                          color: Colors.blueAccent,
                        ),
                        label: const Text('Digitize Learning Materials'),
                      )),
                      children: <Widget>[
                        ListTile(
                          tileColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 40),
                          horizontalTitleGap: 8,
                          minLeadingWidth: 8,
                          title: const Text(
                            'Standard',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          leading: const Icon(Icons.folder),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DLMRoute(
                                id: widget.id,
                                email: widget.email,
                                grade: widget.grade,
                                school: widget.school,
                                subcode: widget.subcode,
                                subjnam: widget.subjnam,
                                userinfo: null,
                                dlm: null,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          tileColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 40),
                          horizontalTitleGap: 8,
                          minLeadingWidth: 8,
                          title: const Text(
                            'Supplementary',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          leading: const Icon(Icons.folder),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DLMRoute2(
                                id: widget.id,
                                email: widget.email,
                                grade: widget.grade,
                                school: widget.school,
                                subcode: widget.subcode,
                                subjnam: widget.subjnam,
                                userinfo: null,
                                dlm: null,
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: ExpansionTile(
                      title: (TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.quiz,
                          color: Colors.blueAccent,
                        ),
                        label: const Text('Digitize Learning Materials'),
                      )),
                      children: <Widget>[
                        ListTile(
                            tileColor: Colors.white,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 40),
                            horizontalTitleGap: 8,
                            minLeadingWidth: 8,
                            title: const Text(
                              'Formattive',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            leading: const Icon(Icons.rule),
                            onTap: null),
                        ListTile(
                          tileColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 40),
                          horizontalTitleGap: 8,
                          minLeadingWidth: 8,
                          title: const Text(
                            'Summative',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          leading: const Icon(Icons.rule),
                          onTap: null,
                        ),
                      ]),
                ),
                ////----////
                const Divider(
                  height: 0,
                  color: Color.fromARGB(255, 217, 217, 217),
                ),

                const Divider(
                  height: 0,
                  color: Color.fromARGB(255, 217, 217, 217),
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: (TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.task,
                      color: Colors.blueAccent,
                    ),
                    label: const Text('eNote'),
                  )),
                ),
                const Divider(
                  height: 0,
                  color: Color.fromARGB(255, 217, 217, 217),
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: (TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.fact_check,
                      color: Colors.blueAccent,
                    ),
                    label: const Text('Summary'),
                  )),
                ),
                const Divider(
                  height: 0,
                  color: Color.fromARGB(255, 217, 217, 217),
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: (TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.quiz,
                      color: Colors.blueAccent,
                    ),
                    label: const Text('Periodical Exam'),
                  )),
                ),
              ],
            ),
          ),
        ),
      );
}
