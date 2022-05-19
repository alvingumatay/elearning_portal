import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 25,
        title: const Text(
          'SDO Marikina eLearning Program',
          style: TextStyle(fontSize: 16),
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
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              child: const Text(
                  'After a series of planning, brainstorming, trainings and workshop, alongside with the preparation of interactive modules and advocacy campaigns, the program was launched at Marikina Teatro for the pilot implementation. In the first year of implementation (SY 2013-2014), four secondary schools in Marikina were chosen to implement the program to Grade 7 students; Marikina Science High School, Tañong High School, Parang High School and Fortune High School. The teachers mentioned above who were tasked to be eWriters were also the first eTeachers except for Ms. Maria Teresa Navarra who was later on replaced by Ms. Roxanne B. Reyes (MAPEH Teachers). Afterrealizing on that school year that a betterenvironment and facilities have to beprovided to the pilot students, the Division Office of Marikina, through the initiative of Mr. Joseph T. Santos,recommended to the Superintendent to open Jesus Dela Peña National High School as Center for eLearning. Jesus Dela Peña National High School was established through the effort of Honorable Mayor Marcelino R. Teodoro,who was then a Congressman. He authored a bill creating a high school in Barangay Jesus Dela Peña which was approved on July 23, 2012, known as Republic Act No. 10216. Despite the challenges, the program is successful and continuously improving. eLearning is now on its fourth year of implementation.Furthermore, the number of eLearning students are growing. The parents as well as teachers became more open-minded with the program, support from different stakeholders especially from private sectors is continuously coming in, the modules, eLearning website and facilities in the school are also improving. Indeed, the program is true to its vision. It is now producing students who are lifelong learners, functionally literate, appreciative of arts and sports with the help of Information and Computer Technology, and imbued with the desirable values;character, discipline, good taste and excellence.',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  textAlign: TextAlign.justify),
            ),
          ],
        ),
      ),
    );
  }
}
