import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/presentation/dashboard_screen/screens/dashboard.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/hint_strings.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/abdominal_discomfort/new_appointment_screen.dart';

class AppointementPage extends StatefulWidget {
const AppointementPage({Key? key}) : super(key: key);
  @override
  _AppointementPageState createState() => _AppointementPageState();
}

class _AppointementPageState extends State<AppointementPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.primarywhiteColor,
        image: DecorationImage(
          alignment: Alignment(1.0, -1.0),
          image: AssetImage(ImageSaource.kString1),
        ),
      ),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _buildAppBar(context),
          body: _buildTabBarView(),
          bottomSheet: _buildBottomSheet(context),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            HintString.kYourAppointment,
            style: GoogleFonts.cairo(
              color: ColorManager.primarydarkGreenColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => DashBoardScreen(),
            ),
            (route) => false,
          );
        },
        child: Container(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.grey,
            )),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => NewAppointmentPage(),
              ),
              (route) => false,
            );
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              ImageSaource.kfloatingactionbutton,
              height: 50,
              width: 50,
            ),
          ),
        )
      ],
      bottom: _buildTabBar(),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      tabs: [
        Tab(text: ScreenTitle.kUpcoming),
        Tab(text: ScreenTitle.kComplete),
        Tab(text: ScreenTitle.kCancel),
      ],
      indicatorColor: Color(0xFF006064),
      labelStyle: GoogleFonts.cairo(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      unselectedLabelStyle: TextStyle(color: Colors.grey),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      children: [
        Center(child: Text(ScreenTitle.kUpcommingAppointment)),
        Center(child: Text(ScreenTitle.kCompletedAppointment)),
        Center(child: Text(ScreenTitle.kCompletedAppointment)),
      ],
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              ImageSaource.kbookappointmentimg,
              height: 250,
            ),
            SizedBox(height: 20),
            Text(
              ScreenTitle.kYoudonthaveappointment,
              style: GoogleFonts.cairo(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            _buildElevatedButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => NewAppointmentPage(),
            ),
            (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          primary: ColorManager.primarydarkGreenColor,
          onPrimary: Colors.white,
          minimumSize: Size(300, 58),
        ),
        child: Text(
          ScreenTitle.kbookappointment,
          style: GoogleFonts.cairo(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
