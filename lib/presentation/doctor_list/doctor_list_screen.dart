import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/hint_strings.dart';
import 'package:patient_app/presentation/date_list.dart/date_list.dart';
import 'package:patient_app/presentation/request_screen/apointment.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({Key? key}) : super(key: key);

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  List<String> doctorNames = [
    'Darrell Steward',
    'Darrell Steward',
    'Darrell Steward',
    'Darrell Steward',
    'Darrell Steward',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              'assets/images/leading_action_button.png',
              height: 40,
              width: 40,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Abdominal Discomfort",
                    style: GoogleFonts.cairo(
                      color: Color(0xFF006064),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Image.asset(
                'assets/images/login_logo.png',
                height: 50,
                width: 50,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Center(
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.1,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 0.8),
                ),
                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search here',
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    HintString.kDoctorList,
                    style: GoogleFonts.cairo(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "SEE ALL",
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF006064),
                            decoration: TextDecoration.none,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFF006064),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: doctorNames.length,
                itemBuilder: (context, index) {
                  return RectangularBoxWidget(doctorName: doctorNames[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RectangularBoxWidget extends StatelessWidget {
  final String doctorName;

  const RectangularBoxWidget({Key? key, required this.doctorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Color(0xFF006064), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/doctor.gif',
              height: 100,
              width: 100,
            ),
          ),
          Positioned(
            top: 0,
            left: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'General Practitioner',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email,
                      size: 30,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '3 years',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Icon(
                      Icons.heat_pump_rounded,
                      size: 30,
                      color: Colors.red,
                    ),
                    Text(
                      '92 %',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 69, 236, 255),
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Monday to Friday',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF006064),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppointmentPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF006064),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Make an Appointment',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/login_logo.png',
              height: 50,
              width: 50,
            ),
          ),
        ],
      ),
    );
  }
}
