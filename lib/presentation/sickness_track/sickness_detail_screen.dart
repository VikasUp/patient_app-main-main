import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/sickness_track/sickness_track_user_page.dart';

class SicknessDetailScreen extends StatefulWidget {
  const SicknessDetailScreen({super.key});
  @override
  State<SicknessDetailScreen> createState() => _SicknessDetailScreenState();
}

class _SicknessDetailScreenState extends State<SicknessDetailScreen> {

  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.primarywhiteColor,
        image: DecorationImage(
          alignment: Alignment(1.0, -1.0),
          image: AssetImage(ImageSaource.kString1),
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Column(
                children: [
                  _buildAppBar(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildCenterImage(),
                          SizedBox(height: 20),
                          _buildDateSection(),
                          SizedBox(height: 10),
                          _buildSicknessTitle(),
                          SizedBox(height: 10),
                          _buildDescription(),
                          SizedBox(height: 15),
                          _buildTimingSection(),
                          SizedBox(height: 30),
                          _buildMonthAndAmountSection(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return _buildAppBarRow();
  }

  Widget _buildAppBarRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
          SizedBox(
            width: 10,
          ),
          Text(
            'Sickness Track',
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

  Widget _buildCenterImage() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/capsule.png',
            height: 180,
            width: 180,
          ),
        ],
      ),
    );
  }

  Widget _buildDateSection() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              'Monday 7 Jan 2023',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSicknessTitle() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Paracetamol XI 2',
            style: GoogleFonts.cairo(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              'Paracetamol overdose causes acute renal failure \n and chronic exposure to paracetamol has been \n linked to chronic failure.',
              style: GoogleFonts.cairo(color: Colors.grey, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTimingSection() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _buildTimingButton(
                'Before Lunch', Color.fromARGB(255, 134, 251, 243)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _buildTimingButton(
                'After Dinner', Color.fromARGB(255, 181, 186, 255),
                color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildTimingButton(String text, Color backgroundColor,
      {Color color = Colors.black}) {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.roboto(fontSize: 14, color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthAndAmountSection() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
                _buildIconTextRow('assets/images/sickness.png', 'This Month'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _buildIconTextRow('assets/images/shoppig_bag.png', 'Amount',
                height: 30, width: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildIconTextRow(String imagePath, String text,
      {double height = 30, double width = 30}) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: height,
              width: width,
            ),
            SizedBox(width: 15),
            Text(text),
          ],
        ),
      ),
    );
  }
}
