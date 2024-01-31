import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/presentation/doctor_bio/doctor_bio_page.dart';
import 'package:patient_app/presentation/tele_medical/widgets/doctors_list_card.dart';

import 'package:patient_app/presentation/video_call/video_call_screen.dart';

class AppointmentDateList extends StatefulWidget {
  const AppointmentDateList({Key? key}) : super(key: key);

  @override
  State<AppointmentDateList> createState() => _AppointmentDateListState();
}

class _AppointmentDateListState extends State<AppointmentDateList> {
  bool containerClicked = false;
  bool column1Clicked = false;
  bool column2Clicked = false;
  bool column3Clicked = false;
  bool column4Clicked = false;

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Image.asset(
                  'assets/images/leading_action_button.png',
                  height: 40,
                  width: 40,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorsListPage(),
                    ),
                  );
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dentist List",
                    style: GoogleFonts.cairo(
                      color: Color(0xFF006064),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: Color(0xFF44B4BF),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/cricular_avatar.png',
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Darrell Steward',
                              style: GoogleFonts.cairo(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              'General Practitioner',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/email.png',
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(width: 8.0),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DoctorBio()),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                  ),
                                  child: Text(
                                    '3 years',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Image.asset(
                                  'assets/images/heart.png',
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '92 %',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 410,
                    child: DateRangePickerWidget(
                      onDateRangeChanged: (dateRange) {
                        if (dateRange != null) {
                          Scaffold.of(context)
                              .showBottomSheet((BuildContext context) {
                            return Container(
                              height: 200,
                              child: Center(
                                child: Text(
                                  'Selected Date Range: ${dateRange.start.toLocal()} - ${dateRange.end.toLocal()}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            );
                          });
                        }
                      },
                      doubleMonth: false,
                      theme: CalendarTheme(
                        selectedColor: Color(0xFF44B4BF),
                        dayNameTextStyle:
                            TextStyle(color: Colors.black45, fontSize: 12),
                        inRangeColor: Color(0xFFD9EDFA),
                        inRangeTextStyle: TextStyle(color: Color(0xFF44B4BF)),
                        selectedTextStyle: TextStyle(color: Colors.white),
                        todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        defaultTextStyle:
                            TextStyle(color: Colors.black, fontSize: 15),
                        radius: 25,
                        tileSize: 51,
                        disabledTextStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Text(
                            'Time Slot',
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              column1Clicked = !column1Clicked;
                            });
                          },
                          child: Container(
                            width: 170,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: column1Clicked
                                  ? Color(0xFF006064)
                                  : Colors.white,
                              border: Border.all(color: Color(0xFF006064)),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 5,
                                ),
                                child: Text(
                                  '10:00 AM : 5:00 PM',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: column1Clicked
                                        ? Colors.white
                                        : Color(0xFF006064),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              column2Clicked = !column2Clicked;
                            });
                          },
                          child: Container(
                            width: 170,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: column2Clicked
                                  ? Color(0xFF006064)
                                  : Colors.white,
                              border: Border.all(color: Color(0xFF006064)),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 5,
                                ),
                                child: Text(
                                  '10:00 AM : 5:00 PM',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: column2Clicked
                                        ? Colors.white
                                        : Color(0xFF006064),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              column3Clicked = !column3Clicked;
                            });
                          },
                          child: Container(
                            width: 170,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: column3Clicked
                                  ? Color(0xFF006064)
                                  : Colors.white,
                              border: Border.all(color: Color(0xFF006064)),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Text(
                                  '10:00 AM : 5:00 PM',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: column3Clicked
                                        ? Colors.white
                                        : Color(0xFF006064),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              column4Clicked = !column4Clicked;
                            });
                          },
                          child: Container(
                            width: 170,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: column4Clicked
                                  ? Color(0xFF006064)
                                  : Colors.white,
                              border: Border.all(color: Color(0xFF006064)),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 13,
                                  vertical: 5,
                                ),
                                child: Text(
                                  '10:00 AM : 5:00 PM',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: column4Clicked
                                        ? Colors.white
                                        : Color(0xFF006064),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: Container(
                  height: 65,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoCallPage(
                                  callID: '1',
                                )),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF006064),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23.0),
                      ),
                    ),
                    child: Text(
                      'Send Appointment Request',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
