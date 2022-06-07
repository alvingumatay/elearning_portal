/*
Title: DepED Marikina eLearning Program
Author: Rio Conales (rioconales@gmail.com)
Developer: DepED Marikina
Module: 1.0
Date Created: 5-31-2022
*/
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 25,
        title: const Text(
          'About Us',
          style: TextStyle(fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, '/');
        },
        child: const Icon(Icons.home),
        backgroundColor: Colors.black54,
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
                            color: Colors.blue,
                            size: 30,
                          ),
                          Text(
                            'About Us',
                            style: TextStyle(
                              color: Colors.blue,
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
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: const Text(
                'An Overview',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: const Text(
                  'One of the problems of the educational system today is the continuous growth of student population in a classroom, especially in the Metro Manila area. For this reason, the Schools Division Office of Marikina responded to the call of Department of Education Secretary Bro. Armin Luistro and planned for the implementation of Alternative Delivery Mode (ADM) especially to secondary schools that lack classrooms. After a thorough study, eLearning was created. eLearning is a modern and effective method of teaching and learning process. This was already implemented in the different parts of the world and even in some prestigious universities in our country. The eLearning Program is now one of the Alternative Delivery Modes offered by the Schools Division of Marikina to provide an option for learners in availing educational services. Its full implementation hoped to have strong impact on learning outcomes and improve school’s key performance indicators, which supports the mission and vision of the Division. With the theme, “Creating Better Opportunities for Learners and Teachers through ICT,” the program focuses on giving the students quality education anytime, anywhere via Electronic Learning. On December 5, 2012, the Executive Committee led by Dr. Elizabeth E. Quesada, Schools Division Superintendent together with the different working committees headed by Mr. Joseph T. Santos, the Program head, conducted their first meeting at the Schools Division Office of Marikina City in order to formally start the development of the program. The Schools Division Office of Marikina selected two groups of teachers from different high schools of Marikina City to work on the realization of the project:',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  textAlign: TextAlign.justify),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: const Text(
                'Group of Writers:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 20, 0),
              minLeadingWidth: 8,
              leading: Icon(
                Icons.circle,
                size: 8,
              ),
              title: Text(
                'Mr. BENEDICTO M. TABILAS - English - Marikina High School',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 20, 0),
              minLeadingWidth: 8,
              leading: Icon(
                Icons.circle,
                size: 8,
              ),
              title: Text(
                'Ms. BIELYNDA C. DAELO - Mathematics - Parang High School',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 20, 0),
              minLeadingWidth: 8,
              leading: Icon(
                Icons.circle,
                size: 8,
              ),
              title: Text(
                'Ms. SALVACION J. ADONA - Science - Marikina Science High School',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 20, 0),
              minLeadingWidth: 8,
              leading: Icon(
                Icons.circle,
                size: 8,
              ),
              title: Text(
                'Ms. FELISA P. YARANON - Filipino - Tañong High School',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 20, 0),
              minLeadingWidth: 8,
              leading: Icon(
                Icons.circle,
                size: 8,
              ),
              title: Text(
                'Ms. BERNADETTE E. SENADO - Araling Panlipunan - Fortune High School',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 20, 0),
              minLeadingWidth: 8,
              leading: Icon(
                Icons.circle,
                size: 8,
              ),
              title: Text(
                'Ms. JENNIFER DELA ROSA - T.L.E. - Fortune High School',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 20, 0),
              minLeadingWidth: 8,
              leading: Icon(
                Icons.circle,
                size: 8,
              ),
              title: Text(
                'Ms. ROXANNE REYES - MAPEH - Fortune High School',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 20, 0),
              minLeadingWidth: 8,
              leading: Icon(
                Icons.circle,
                size: 8,
              ),
              title: Text(
                'Ms. FLERIDA D. VENZON - Edukasyon sa Pagpapakatao - Tañong High School',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 20, 0),
              minLeadingWidth: 8,
              leading: Icon(
                Icons.circle,
                size: 8,
              ),
              title: Text(
                'Ms. MA. THERESA O. NAVARRA - MAPEH - Parang High School',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: const Text(
                'Group of Designers:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 20, 0),
              minLeadingWidth: 8,
              leading: Icon(
                Icons.circle,
                size: 8,
              ),
              title: Text(
                'Leilanie N. Villanueva - Marikina Science High Science',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 20, 0),
              minLeadingWidth: 8,
              leading: Icon(
                Icons.circle,
                size: 8,
              ),
              title: Text(
                'Donnalynn W. Mercado - Parang High School',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 20, 0),
              minLeadingWidth: 8,
              leading: Icon(
                Icons.circle,
                size: 8,
              ),
              title: Text(
                'Anna Marie E. Dadulla - Fortune High School',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 20, 0),
              minLeadingWidth: 8,
              leading: Icon(
                Icons.circle,
                size: 8,
              ),
              title: Text(
                'Marvin L. Maglalang - Marikina Science High School',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: const Text(
                  'After a series of planning, brainstorming, trainings and workshop, alongside with the preparation of interactive modules and advocacy campaigns, the program was launched at Marikina Teatro for the pilot implementation. In the first year of implementation (SY 2013-2014), four secondary schools in Marikina were chosen to implement the program to Grade 7 students; Marikina Science High School, Tañong High School, Parang High School and Fortune High School. The teachers mentioned above who were tasked to be eWriters were also the first eTeachers except for Ms. Maria Teresa Navarra who was later on replaced by Ms. Roxanne B. Reyes (MAPEH Teachers). Afterrealizing on that school year that a betterenvironment and facilities have to beprovided to the pilot students, the Division Office of Marikina, through the initiative of Mr. Joseph T. Santos,recommended to the Superintendent to open Jesus Dela Peña National High School as Center for eLearning. Jesus Dela Peña National High School was established through the effort of Honorable Mayor Marcelino R. Teodoro,who was then a Congressman. He authored a bill creating a high school in Barangay Jesus Dela Peña which was approved on July 23, 2012, known as Republic Act No. 10216. Despite the challenges, the program is successful and continuously improving. eLearning is now on its fourth year of implementation.Furthermore, the number of eLearning students are growing. The parents as well as teachers became more open-minded with the program, support from different stakeholders especially from private sectors is continuously coming in, the modules, eLearning website and facilities in the school are also improving. Indeed, the program is true to its vision. It is now producing students who are lifelong learners, functionally literate, appreciative of arts and sports with the help of Information and Computer Technology, and imbued with the desirable values;character, discipline, good taste and excellence.',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  textAlign: TextAlign.justify),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              height: 10,
              color: Colors.grey[300],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: const Text(
                'Vision',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: const Text(
                  'We dream of Filipinos who passionately love their country and whose values and competencies enable them to realize their full potential and contribute meaningfully to building the nation.',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  textAlign: TextAlign.justify),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: const Text(
                  'As a learner-centered public institution, the Department of Education continuously improves itself to better serve its stakeholders.',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  textAlign: TextAlign.justify),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              height: 10,
              color: Colors.grey[300],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Mission',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: const Text(
                  'To protect and promote the right of every Filipino to quality, equitable, culture-based, and complete basic education where:',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  textAlign: TextAlign.justify),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                        text: 'Students',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            ' learn in a child-friendly, gender-sensitive, safe, and motivating environment.'),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                        text: 'Teachers',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            ' facilitate learning and constantly nurture every learner.'),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                        text: 'Administrators and staff,',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            ' as stewards of the institution, ensure an enabling and supportive environment for effective learning to happen.'),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                        text: 'Family, community, and other stakeholders',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            ' are actively engaged and share responsibility for developing life-long learners.'),
                  ],
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
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: const Text(
                'Core Values',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: const Text(
                'Maka-Diyos',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: const Text(
                'Maka-tao',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: const Text(
                'Makakalikasan',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: const Text(
                'Makabansa',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              height: 10,
              color: Colors.grey[300],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: const Text(
                'Mandates',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: const Text(
                  'The Department of Education was established through the Education Decree of 1863 as the Superior Commission of Primary Instruction under a Chairman. The Education agency underwent many reorganization efforts in the 20th century in order to better define its purpose vis a vis the changing administrations and charters. The present day Department of Education was eventually mandated through Republic Act 9155, otherwise known as the Governance of Basic Education act of 2001 which establishes the mandate of this agency.',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  textAlign: TextAlign.justify),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: const Text(
                  'The Department of Education (DepEd) formulates, implements, and coordinates policies, plans, programs and projects in the areas of formal and non-formal basic education. It supervises all elementary and secondary education institutions, including alternative learning systems, both public and private; and provides for the establishment and maintenance of a complete, adequate, and integrated system of basic education relevant to the goals of national development.',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  textAlign: TextAlign.justify),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              height: 10,
              color: Colors.grey[300],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: const Text(
                'eLearning Program Structure',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0),
              child: Image.network(
                'https://www.elearningmarikina.ph/web_mobile/images/eLearning-Structure.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              height: 10,
              color: Colors.grey[300],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
