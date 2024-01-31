import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/hint_strings.dart';
import 'package:patient_app/presentation/tele_medical/widgets/appointment_date_list.dart';
import 'package:patient_app/presentation/tele_medical/widgets/teli_list.dart';

class DoctorsListPage extends StatefulWidget {
  const DoctorsListPage({Key? key}) : super(key: key);
  @override
  State<DoctorsListPage> createState() => _DoctorsListPageState();
}

class _DoctorsListPageState extends State<DoctorsListPage> {
  List<String> doctorNames = [
    'Darrell Steward',
    'Darrell Steward',
    'Darrell Steward',
    'Darrell Steward',
    'Darrell Steward',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          alignment: Alignment(1.0, -1.0),
          image: AssetImage('assets/images/noti_background.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 110,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                icon: Image.asset(
                  'assets/images/leading_action_button.png',
                  height: 40,
                  width: 50,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeleMedicalList(),
                    ),
                  );
                },
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
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 115,
                    child: IconButton(
                      icon: Image.asset(
                        'assets/images/login_logo.png',
                        height: 50,
                        width: 50,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
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
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: Colors.black, width: 0.8),
                  ),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search here',
                        hintStyle: GoogleFonts.cairo(fontSize: 18),
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
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
    var size = MediaQuery.of(context).size;
    Color myButtonColor = Color.fromARGB(255, 68, 180, 191);
    return Container(
      height: 310,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 25),
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
            top: 10,
            left: 0,
            child: Image.asset(
              'assets/images/cricular_avatar.png',
              height: 100,
              width: 100,
            ),
          ),
          Positioned(
            top: 10,
            left: 120,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              doctorName,
                              style: GoogleFonts.cairo(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/video_call.png',
                              height: 48,
                              width: 48,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'General Practitioner',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 5),
                        Text(
                          'Online',
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 15,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Offline',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.red,
                          size: 15,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/email.png',
                          height: 30,
                          width: 30,
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
                        Image.asset(
                          'assets/images/heart.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 10,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromARGB(255, 170, 246, 255),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Text(
                          'Monday to Friday',
                          style: GoogleFonts.roboto(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF006064),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Container(
                        child: Center(
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.5,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AppointmentDateList()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: myButtonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: Text(
                                'Make an Appointment',
                                style: GoogleFonts.cairo(
                                  color: Colors.white,
                                  fontSize: size.width * 0.035,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 1,
            left: 25,
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
