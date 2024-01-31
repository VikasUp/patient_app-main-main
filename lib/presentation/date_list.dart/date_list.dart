import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/hint_strings.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/abdominal_discomfort/abdominal_discomfort.dart';
import 'package:patient_app/presentation/otp_screen/otp_page.dart';

class DateList extends StatefulWidget {
  const DateList({Key? key}) : super(key: key);

  @override
  State<DateList> createState() => _DateListPageState();
}

class _DateListPageState extends State<DateList> {
  bool containerClicked = false;
  int selectedColumn = 0;

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
      child: Scaffold(
        backgroundColor: ColorManager.transparentColor,
        appBar: AppBar(
          backgroundColor: ColorManager.transparentColor,
          toolbarHeight: 100,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Image.asset(
                  ImageSaource.kString5,
                  height: 40,
                  width: 40,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AbdominalDiscomfortPage(),
                    ),
                  );
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ScreenTitle.kDentistList,
                    style: GoogleFonts.cairo(
                      color: ColorManager.primarydarkGreenColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageSaource.kloginLogo),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          ImageSaource.kString4,
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ScreenTitle.kDoctorName,
                              style: GoogleFonts.cairo(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              ScreenTitle.kGeneralPractitioner,
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  ImageSaource.kEmail,
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  HintString.kyears,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Image.asset(
                                  ImageSaource.kheart,
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  HintString.kpercentage,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 410,
                      child: DateRangePickerWidget(
                        onDateRangeChanged: (dateRange) {},
                        doubleMonth: false,
                        theme: CalendarTheme(
                          selectedColor: Color(0xFF44B4BF),
                          dayNameTextStyle:
                              TextStyle(color: Colors.black45, fontSize: 12),
                          inRangeColor: Color(0xFFD9EDFA),
                          inRangeTextStyle: TextStyle(color: Color(0xFF44B4BF)),
                          selectedTextStyle: TextStyle(color: Colors.white),
                          todayTextStyle:
                              TextStyle(fontWeight: FontWeight.bold),
                          defaultTextStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                          radius: 25,
                          tileSize: 51,
                          disabledTextStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
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
                            ScreenTitle.kTimeSlot,
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        buildClickableColumn(1),
                      ],
                    ),
                    Column(children: [
                      buildClickableColumn(2),
                    ]),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        buildClickableColumn(3),
                      ],
                    ),
                    Column(children: [
                      buildClickableColumn(4),
                    ]),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: Container(
                  height: 65,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              height: 300,
                              width: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImageSaource.kdialougeBox,
                                    height: 200,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        ScreenTitle.kdialougueText,
                                        style: GoogleFonts.roboto(),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Text(
                                        ScreenTitle.kSuccessfully,
                                        style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Text(ScreenTitle.kAppointmentID,
                                        style: TextStyle(
                                            color: Color(
                                              0xFF006064,
                                            ),
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OtpPage(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(23),
                                      border: Border.all(
                                        color: Color(0xFF006064),
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 10,
                                    ),
                                    child: Text(
                                      ScreenTitle.kOk,
                                      style: GoogleFonts.cairo(
                                        fontSize: 18,
                                        color: Color(0xFF006064),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF006064),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23.0),
                      ),
                    ),
                    child: Text(
                      ScreenTitle.kAppointmentRequest,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildClickableColumn(int columnIndex) {
    bool isClicked = selectedColumn == columnIndex;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
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
                  width: 170,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: isClicked ? Color(0xFF006064) : Colors.white,
                    border: Border.all(color: Color(0xFF006064)),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      child: Text(
                        ScreenTitle.kTiming,
                        style: TextStyle(
                          fontSize: 15,
                          color: isClicked ? Colors.white : Color(0xFF006064),
                        ),
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
