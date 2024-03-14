import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/presentation/FeedBack/feed_back_dashboard.dart';
import 'package:patient_app/presentation/announcement/announcement_dashboard.dart';
import 'package:patient_app/presentation/blood_request/blood_request_dashboard.dart';
import 'package:patient_app/presentation/complain/complain_dashboard.dart';
import 'package:patient_app/presentation/dashboard_screen/widgets/bottom_widgets.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/hint_strings.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/abdominal_discomfort/appointment.dart';
import 'package:patient_app/presentation/download_report/download_report.dart';
import 'package:patient_app/presentation/emergency_services/emergency_dashboard.dart';
import 'package:patient_app/presentation/home_checkup/home_checkup.dart';
import 'package:patient_app/presentation/meal/meal_dashboard.dart';
import 'package:patient_app/presentation/radiology_report/radiology_dashboard.dart';
import 'package:patient_app/presentation/refill_page/refill_page.dart';
import 'package:patient_app/presentation/sickness_track/sickness_track_user_page.dart';
import 'package:patient_app/presentation/tele_medical/tele_medical.dart';
import 'package:patient_app/presentation/vital_signs/vital_signs.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;
  TextEditingController _searchController = TextEditingController();
  List<String> filteredLabels = [];
  List<String> imagePaths = [
    'assets/images/appointment.png',
    'assets/images/consulting.png',
    'assets/images/home_checkup.png',
    'assets/images/prescription.png',
    'assets/images/pulse.png',
    'assets/images/blood_request.png',
    'assets/images/book_lab_test.png',
    'assets/images/ambulance (1).png',
    'assets/images/complain.png',
    'assets/images/download_report.png',
    'assets/images/refil.png',
    'assets/images/refill.svg',
    'assets/images/Group 66700.png',
    'assets/images/announcement.png',
    'assets/images/feedback.png',
  ];

  List<String> labels = [
    'Appointment',
    'Tele Medical',
    'Home Checkup',
    'Sickness Track',
    'Vital Signs',
    'Blood Request',
    'Book Lab Test',
    'Emergency Services',
    'Complain',
    'Download Report',
    'Meal',
    'Refill',
    'Radiology',
    'Announcement',
    'FeedBack',
  ];

  @override
  void initState() {
    super.initState();
    filteredLabels = labels;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _search() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredLabels =
          labels.where((label) => label.toLowerCase().contains(query)).toList();
    });
  }

  Route _createRoute({required Widget destination}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: ColorManager.primarydarkGreenColor,
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Scaffold(
                appBar: _buildAppBar(size),
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSearchBar(size),
                              _buildServicesHeader(),
                              _buildServicesGrid(),
                              SizedBox(
                                height: 20,
                              ),
                              _buildUpcomingSchedule(size),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: MyBottomNavigationBar(
                  selectedIndex: _selectedIndex,
                  onTabTapped: _onItemTapped,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildAppBar(Size size) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            ScreenTitle.kGoodMorning,
            style: GoogleFonts.cairo(
              fontSize: 18,
            ),
          ),
          Text(
            ScreenTitle.kname,
            style: GoogleFonts.cairo(
                color: ColorManager.primarydarkGreenColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ],
      ),
      leading: IconButton(
        onPressed: () {},
        icon: Image.asset(
          ImageSaource.kString2,
          width: 30,
          height: 30,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            ImageSaource.kString3,
            width: 50,
            height: 50,
          ),
        )
      ],
      toolbarHeight: 120,
      titleSpacing: 10,
      flexibleSpace: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(
              ImageSaource.kString1,
            ),
            alignment: Alignment.centerRight,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(Size size) {
    return Center(
      child: Container(
        height: 59,
        width: size.width / 0.8,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: TextFormField(
            controller: _searchController,
            onChanged: (value) => _search(),
            decoration: InputDecoration(
              hintText: HintString.ksearch,
              hintStyle: GoogleFonts.cairo(
                fontSize: 16,
                color: Color.fromARGB(255, 64, 64, 64),
              ),
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildServicesHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            HintString.kServices,
            style: GoogleFonts.cairo(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              _buildViewAllText(),
              SizedBox(width: 8.0),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildViewAllText() {
    return Container(
      child: Text(
        HintString.kViewAll,
        style: GoogleFonts.cairo(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: ColorManager.primarydarkGreenColor,
          decoration: TextDecoration.none,
        ),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorManager.primarydarkGreenColor,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  Widget _buildServicesGrid() {
    return Container(
      child: Hero(
        transitionOnUserGestures: true,
        tag: 'hello',
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 20.0,
              ),
              itemCount: filteredLabels.length,
              itemBuilder: (context, index) {
                if (index < imagePaths.length && index < labels.length) {
                  return _buildServiceItem(index);
                } else {
                  return SizedBox.shrink();
                }
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildServiceItem(int index) {
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              _createRoute(
                destination: AppointementPage(),
              ),
            );

            break;
          case 1:
            Navigator.push(
              context,
              _createRoute(
                destination: TeleMedicalPage(),
              ),
            );

            break;
          case 2:
            Navigator.push(
              context,
              _createRoute(
                destination: HomeCheckUpPage(),
              ),
            );
          case 3:
            Navigator.push(
              context,
              _createRoute(
                destination: SicknessTrackUserPage(),
              ),
            );
            break;
          case 4:
            Navigator.push(
                context,
                _createRoute(
                  destination: VitalSigns(),
                ));
            break;
          case 5:
            Navigator.push(
                context, _createRoute(destination: BloodRequestPage()));
            break;
          case 7:
            Navigator.push(context,
                _createRoute(destination: EmergencyServicesDashboard()));
          case 8:
            Navigator.push(
                context, _createRoute(destination: ComplainDashboard()));
          case 9:
            Navigator.push(
                context, _createRoute(destination: DownloadReport()));
          case 10:
            Navigator.push(context, _createRoute(destination: Meal()));
          case 11:
            Navigator.push(context, _createRoute(destination: RefillPills()));
          case 12:
            Navigator.push(
                context, _createRoute(destination: RadiologyReport()));
          case 13:
            Navigator.push(
                context, _createRoute(destination: AnnouncementDashboard()));
          case 14:
            Navigator.push(context, _createRoute(destination: FeedBack()));
        }
      },
      child: AspectRatio(
        aspectRatio: 2.0,
        child: Card(
          child: Container(
            width: 120.0,
            height: 190.0,
            decoration: BoxDecoration(
              color: ColorManager.silverColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                !imagePaths[index].contains('svg')
                    ? Image.asset(
                        imagePaths[index],
                        width: 70,
                        height: 46,
                      )
                    : SvgPicture.asset(
                        imagePaths[index],
                      ),
                SizedBox(height: 5, width: 10),
                Text(
                  filteredLabels[index],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingSchedule(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      decoration: BoxDecoration(
        color: ColorManager.primarywhiteColor,
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: ColorManager.primarydarkGreenColor, width: 0.6),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildUpcomingScheduleInfo(),
                  VerticalDivider(
                    color: Color.fromARGB(255, 200, 198, 198),
                    indent: size.height * 0.01,
                    endIndent: size.height * 0.01,
                    thickness: size.width * 0.005,
                  ),
                  _buildVisitText(),
                ],
              ),
            ),
          ),
          Expanded(
            child: _buildUpcomingScheduleDetails(size),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingScheduleInfo() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          HintString.kupcommingSchedule,
          style: GoogleFonts.cairo(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Text(
          HintString.kVisitSchedule,
          style: GoogleFonts.cairo(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildVisitText() {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Text(
          HintString.kvisit,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.04,
          ),
        )
      ],
    );
  }

  Widget _buildUpcomingScheduleDetails(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 22, 171, 176),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
        vertical: size.height * 0.01,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildProfileImageSmall(size),
          SizedBox(width: size.width * 0.02),
          _buildUpcomingScheduleDetailsText(),
          SizedBox(width: size.width * 0.15),
          VerticalDivider(
            color: Colors.white,
            indent: size.height * 0.01,
            endIndent: size.height * 0.01,
            thickness: size.width * 0.005,
          ),
          SizedBox(width: size.width * 0.12),
          _buildTimeDetails(),
        ],
      ),
    );
  }

  Widget _buildProfileImageSmall(Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size.width * 0.15),
      child: Image.asset(
        ImageSaource.kString4,
        height: size.width * 0.15,
        width: size.width * 0.15,
      ),
    );
  }

  Widget _buildUpcomingScheduleDetailsText() {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ScreenTitle.kname2,
          style: GoogleFonts.cairo(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
            color: ColorManager.primarywhiteColor,
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Text(
          ScreenTitle.kvisit,
          style: GoogleFonts.cairo(
            fontSize: size.width * 0.035,
            color: ColorManager.primarywhiteColor,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeDetails() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          ScreenTitle.kmonth,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            color: ColorManager.primarywhiteColor,
            fontSize: size.width * 0.04,
          ),
        ),
        Text(
          ScreenTitle.ktime,
          style: GoogleFonts.cairo(
            color: ColorManager.primarywhiteColor,
            fontSize: size.width * 0.03,
          ),
        ),
      ],
    );
  }
}
