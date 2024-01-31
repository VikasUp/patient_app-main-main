import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/presentation/doctor_bio/doctor_bio_page.dart';
import 'package:patient_app/presentation/tele_medical/tele_medical.dart';

class SendRequest extends StatefulWidget {
  const SendRequest({Key? key}) : super(key: key);

  @override
  State<SendRequest> createState() => _SendRequestPageState();
}

class _SendRequestPageState extends State<SendRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/leading_action_button.png',
              height: 40,
              width: 40,
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
      body: SingleChildScrollView(
        child: Column(
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
                            style: TextStyle(
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
                              Text(
                                '3 years',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
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
                              fontWeight: FontWeight.bold, fontSize: 19),
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
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 150,
                        height: 35,
                        decoration: BoxDecoration(
                            // color: Color(0xFF006064),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Color(
                                    0xFF006064)) // Optional: Add rounded corners
                            ),
                        child: Center(
                          child: Text(
                            '10:00 AM : 5:00 PM',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF006064), // Set text color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 150,
                        height: 35, // Set the height of the rectangle
                        decoration: BoxDecoration(
                            // color: Color(0xFF006064),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Color(
                                    0xFF006064)) // Optional: Add rounded corners
                            ),
                        child: Center(
                          child: Text(
                            '10:00 AM : 5:00 PM',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF006064) // Set text color
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
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 150,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(0xFF006064))),
                        child: Center(
                          child: Text(
                            '10:00 AM : 5:00 PM',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF006064),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 150,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(0xFF006064))),
                        child: Center(
                          child: Text(
                            '10:00 AM : 5:00 PM',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF006064)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 1.5,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DoctorBio()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 79, 219, 231),
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
            ),
          ],
        ),
      ),
    );
  }
}
