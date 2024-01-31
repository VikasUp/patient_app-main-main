import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/dashboard_screen/widgets/bottom_widgets.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/hint_strings.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/apponintment_screen/appointment.dart';
import 'package:patient_app/presentation/home_checkup/home_checkup.dart';
import 'package:patient_app/presentation/tele_medical/tele_medical.dart';

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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          alignment: Alignment(1.0, -1.0),
          image: AssetImage(ImageSaource.kString1),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(size),
        body: SingleChildScrollView(
          child: _buildBody(size),
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onTabTapped: _onItemTapped,
        ),
      ),
    );
  }

  AppBar _buildAppBar(Size size) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 110,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: _buildAppBarTitle(size),
    );
  }

  Widget _buildAppBarTitle(Size size) {
    return Row(
      children: [
        Image.asset(
          ImageSaource.kString2,
          height: 30,
          width: 30,
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  ScreenTitle.kGoodMorning,
                  style: GoogleFonts.cairo(
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                ScreenTitle.kname,
                style: GoogleFonts.cairo(
                  color: Color(0xFF006064),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        _buildProfileImage(),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      children: [
        Container(
          height: 150,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          top: 40,
          left: 115,
          child: IconButton(
            icon: Image.asset(
              ImageSaource.kString3,
              height: 50,
              width: 50,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildBody(Size size) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            _buildSearchBar(size),
            const SizedBox(height: 16),
            _buildServicesHeader(),
            const SizedBox(height: 16),
            _buildServicesGrid(),
            const SizedBox(height: 25),
            _buildUpcomingSchedule(size),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(Size size) {
    return Center(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Colors.black, width: 0.5),
        ),
        color: ColorManager.primarywhiteColor,
        child: Container(
          height: 50,
          width: size.width / 0.8,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
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
    );
  }

  Widget _buildServicesGrid() {
    return Container(
      child: GridView.builder(
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
              MaterialPageRoute(
                builder: (context) => AppointementPage(),
              ),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TeleMedicalPage(),
              ),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeCheckUpPage(),
              ),
            );
            break;
        }
      },
      child: AspectRatio(
        aspectRatio: 1.0,
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
              Image.asset(
                imagePaths[index],
                width: 70,
                height: 46,
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
    );
  }

  Widget _buildUpcomingSchedule(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF006064), width: 0.6),
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
            fontSize: size.width * 0.04,
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
            color: Colors.white,
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Text(
          ScreenTitle.kvisit,
          style: GoogleFonts.cairo(
            fontSize: size.width * 0.035,
            color: Colors.white,
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
            color: Colors.white,
            fontSize: size.width * 0.04,
          ),
        ),
        Text(
          ScreenTitle.ktime,
          style: GoogleFonts.cairo(
            color: Colors.white,
            fontSize: size.width * 0.03,
          ),
        ),
      ],
    );
  }
}
