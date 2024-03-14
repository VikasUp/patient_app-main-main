import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/complain/complain_report.dart';

class ComplainDashboard extends StatefulWidget {
  const ComplainDashboard({super.key});

  @override
  State<ComplainDashboard> createState() => _ComplainDashboardState();
}

Widget _centerImage() {
  return Container(
    height: 300,
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      child: SvgPicture.asset(
        "assets/images/Group 66704.svg",
      ),
    ),
  );
}

class _ComplainDashboardState extends State<ComplainDashboard> {
  List<String> imagePaths = [
    'assets/images/cleaning.svg',
    'assets/images/nurses.svg',
    'assets/images/medicines.svg',
    'assets/images/meal_svg.svg',
    'assets/images/doctor (5) (1).svg',
  ];

  List<String> labels = [
    'Cleaning',
    'Nurse',
    'Medicine',
    'Meal',
    'Doctor',
  ];

  String _currentAppBarTitle = ScreenTitle.kComplainPage;
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
      child: SafeArea(
        child: Container(
            child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: Column(
              children: [
                _buildAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _centerImage(),
                        SizedBox(
                          height: 15,
                        ),
                        _centerText(),
                        SizedBox(
                          height: 10,
                        ),
                        _buildServicesGrid(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget _buildAppBar() {
    return _buildAppBarRow();
  }

  Widget _buildAppBarRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Material(
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Complain',
            style: GoogleFonts.cairo(
              color: Color(0xFF006064),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Spacer(),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageSaource.kloginLogo),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _centerText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Choose Your Complain Type',
            style: GoogleFonts.roboto(
                fontSize: 16, fontWeight: FontWeight.w800, color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget _buildServicesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1.0,
              ),
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                if (index < labels.length) {
                  return _buildServiceItem(imagePaths[index], labels[index]);
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

  Widget _buildServiceItem(String imagePath, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ComplainReport(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFFF6F7FA),
              border: Border.all(
                color: Color(0xFF848484),
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imagePath,
                height: 75,
                width: 75,
              ),
              SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
