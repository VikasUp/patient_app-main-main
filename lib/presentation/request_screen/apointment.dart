import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/presentation/video_call/video_call_screen.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
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
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Dr. John Doe',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'General Practitioner',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            '3 years',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.heat_pump_rounded,
                            size: 30,
                            color: Colors.red,
                          ),
                          Text(
                            '92 %',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DateRangePickerWidget(
                    onDateRangeChanged: (dateRange) {},
                    doubleMonth: false,
                    theme: CalendarTheme(
                      selectedColor: Colors.blue,
                      dayNameTextStyle:
                          TextStyle(color: Colors.black45, fontSize: 10),
                      inRangeColor: Color(0xFFD9EDFA),
                      inRangeTextStyle: TextStyle(color: Colors.blue),
                      selectedTextStyle: TextStyle(color: Colors.white),
                      todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
                      defaultTextStyle:
                          TextStyle(color: Colors.black, fontSize: 14),
                      radius: 20,
                      tileSize: 38.5,
                      disabledTextStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
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
            Wrap(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Color(0xFF006064))),
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text(
                          '10:00 AM : 5:00 PM',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF006064),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Color(0xFF006064))),
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text(
                          '10:00 AM : 5:00 PM',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF006064),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Color(0xFF006064))),
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text(
                          '10:00 AM : 5:00 PM',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF006064),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Color(0xFF006064))),
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text(
                          '10:00 AM : 5:00 PM',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF006064),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
              
                Center(
                  child: Container(
                    height: 60, 
                    width: MediaQuery.of(context).size.width /
                        1.5, 
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoCallPage(
                                    callID: '',
                                  )),
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
          ],
        ),
      ),
    );
  }
}
