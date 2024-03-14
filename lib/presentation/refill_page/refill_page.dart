import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_app/presentation/refill_page/refill_pills_form.dart';

class RefillPills extends StatefulWidget {
  const RefillPills({super.key});
  @override
  State<RefillPills> createState() => _RefillPillsState();
}

class _RefillPillsState extends State<RefillPills> {
  String _currentAppBarTitle = ScreenTitle.kRefillPage;
  @override
  void initState() {
    super.initState();
    _currentAppBarTitle = ScreenTitle.kRefillPage;
  }

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
                          height: 20,
                        ),
                        _textFormFields()
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
      padding: EdgeInsets.all(8.0),
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
            ScreenTitle.kRefillPage,
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

  Widget _centerImage() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/bag.svg"),
        ],
      ),
    );
  }

  Widget _textFormFields() {
    Color myColor = Color(0xFFF5F5F5);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RefillPillsForm()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0B7F8C),
                    ColorManager.primarydarkGreenColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ),
                  BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RefillPillsForm()));
                  },
                  splashColor: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Add Refill Request',
                      style: GoogleFonts.cairo(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
