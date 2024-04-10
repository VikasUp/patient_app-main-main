import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/hint_strings.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/dashboard_screen/screens/dashboard.dart';
import 'package:patient_app/presentation/vital_signs/progress_indicator.dart';

class AnnouncementDashboard extends StatefulWidget {
  const AnnouncementDashboard({Key? key}) : super(key: key);

  @override
  State<AnnouncementDashboard> createState() => _AnnouncementDashboardState();
}

class _AnnouncementDashboardState extends State<AnnouncementDashboard> {
  List<String> entries = [
    'Whats Personality Got to do with us ? A Lot',
    'Whats Personality Got to do with us ? A Lot',
    'Whats Personality Got to do with us ? A Lot',
    'Whats Personality Got to do with us ? A Lot',
  ];

  bool startAnimation = true;
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

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
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: const Color.fromARGB(255, 231, 229, 229),
                          ),
                          child: IconButton(
                            iconSize: 20,
                            onPressed: () {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashBoardScreen()));
                            },
                            icon: Container(
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.grey.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        ScreenTitle.kAnnouncementPage,
                        style: GoogleFonts.cairo(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primarydarkGreenColor,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          ImageSaource.kloginLogo,
                          height: 55,
                          width: 55,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: TextFormField(
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        height: size.height * 0.6,
                        child: ListView.separated(
                          primary: false,
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                            horizontal: 9,
                          ),
                          itemCount: entries.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              transform: Matrix4.translationValues(
                                startAnimation ? 0 : size.width,
                                0,
                                0,
                              ),
                              child: _buildListItem(
                                index,
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: 20,
                          ),
                        ),
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

  Widget _buildListItem(int index) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 200),
      opacity: startAnimation ? 1.0 : 0.0,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(
          startAnimation ? 0 : size.width,
          0,
          0,
        ),
        child: GestureDetector(
          onTap: () {
           
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(10),
                bottomStart: Radius.circular(10),
                bottomEnd: Radius.circular(10),
              ),
              border: Border.all(color: Color(0xFF707070), width: 0.1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: const Offset(
                    4.0,
                    4.0,
                  ),
                  blurRadius: 6.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              child: ListTile(
                title: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'By Richard Kensinger',
                              style: GoogleFonts.cairo(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Text('27.01.2021',
                                style: GoogleFonts.cairo(color: Colors.grey)),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entries[index],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            'It is Long established fact thar a reader will be distracted by the\nredabele content of a page when looking at its layout. \n The point of using as Opposed to using',
                            style: GoogleFonts.roboto(
                                fontSize: 10,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
