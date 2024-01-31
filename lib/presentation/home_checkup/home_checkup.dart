import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/presentation/create_new_appointment/new_appointment_screen.dart';
import 'package:patient_app/presentation/home_checkup/home_checkup_form.dart';

class HomeCheckUpPage extends StatefulWidget {
  const HomeCheckUpPage({Key? key}) : super(key: key);

  @override
  _HomeCheckUpPageState createState() => _HomeCheckUpPageState();
}

class _HomeCheckUpPageState extends State<HomeCheckUpPage> {
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
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
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
                        "Home Checkup",
                        style: GoogleFonts.cairo(
                          color: Color(0xFF006064),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/images/floating_action_button.png',
                    height: 45,
                    width: 45,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookingScreen()),
                    );
                  },
                ),
              ],
            ),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Schedule'),
                Tab(text: 'Complete'),
                Tab(text: 'Cancel'),
              ],
              indicatorColor: Color(0xFF006064),
              labelStyle: GoogleFonts.cairo(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              unselectedLabelStyle: TextStyle(color: Colors.grey),
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Upcoming Appointments')),
              Center(child: Text('Completed Appointments')),
              Center(child: Text('Canceled Appointments')),
            ],
          ),
          bottomSheet: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/home_checkup_1.png',
                    height: 250,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "You don't have any Home visit",
                    style: GoogleFonts.cairo(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookingScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF006064),
                        onPrimary: Colors.white,
                        minimumSize: Size(300, 58),
                      ),
                      child: Text(
                        'Book new visit',
                        style: GoogleFonts.cairo(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
