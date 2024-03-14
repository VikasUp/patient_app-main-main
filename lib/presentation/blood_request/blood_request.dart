import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/blood_request/request_blood_form.dart';
import 'package:patient_app/presentation/dashboard_screen/screens/dashboard.dart';

class BloodRequestDonorPage extends StatefulWidget {
  const BloodRequestDonorPage({super.key});
  @override
  State<BloodRequestDonorPage> createState() => _BloodRequestDonorPageState();
}

class _BloodRequestDonorPageState extends State<BloodRequestDonorPage> {
  int selectedColumn = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            color: ColorManager.primarywhiteColor,
            image: DecorationImage(
              alignment: Alignment(1.0, -1.0),
              image: AssetImage(ImageSaource.kString1),
            ),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage(
                      ImageSaource.kbloodRequestBgImage,
                    ),
                    fit: BoxFit.fitWidth),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Material(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
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
                          ScreenTitle.kSicknessPage,
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
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            ImageSaource.kbloodRequestBgImage,
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Text(
                      'Choose Blood Type',
                      style: GoogleFonts.cairo(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 90, vertical: 20),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              buildClickableColumn(1, 'O+'),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(children: [
                            buildClickableColumn(2, 'O-'),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorManager.primarywhiteColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 90,
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              buildClickableColumn(3, 'B+'),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(children: [
                            buildClickableColumn(4, 'B-'),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 90, vertical: 20),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              buildClickableColumn(5, 'AB+'),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(children: [
                            buildClickableColumn(6, 'AB-'),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 90,
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              buildClickableColumn(7, 'A+'),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(children: [
                            buildClickableColumn(8, 'A-'),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RequestBloodForm(),
                          ));
                    },
                    child: Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color(0xFF0A737E),
                        borderRadius: BorderRadius.circular(30),
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
                            offset: const Offset(
                              4.0,
                              4.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.grey,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Center(
                          child: Text(
                        'Next',
                        style: GoogleFonts.cairo(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildClickableColumn(int columnIndex, String buttonName) {
    bool isClicked = selectedColumn == columnIndex;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.primarywhiteColor,
      ),
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColumn = columnIndex;
                  });
                },
                child: Container(
                  width: 91,
                  height: 91,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(90),
                    border: Border.all(
                      color: isClicked ? Colors.red : Colors.transparent,
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 224, 224, 224),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(4, 4),
                      ),
                      BoxShadow(
                          color: Color.fromARGB(255, 224, 224, 224),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(-4, -4))
                    ],
                  ),
                  child: Center(
                    child: Text(
                      buttonName,
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
