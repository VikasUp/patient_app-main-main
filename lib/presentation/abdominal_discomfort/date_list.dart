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
            ],
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => AbdominalDiscomfortPage(),
                ),
                ((route) => false),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
            color: Colors.grey,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  ImageSaource.kloginLogo,
                  height: 50,
                  width: 50,
                ))
          ],
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
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                      color: ColorManager.lightBlueColor,
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
                                    color: ColorManager.primarywhiteColor,
                                  ),
                                ),
                                SizedBox(height: 16.0),
                                Text(
                                  ScreenTitle.kGeneralPractitioner,
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: ColorManager.primarywhiteColor,
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
                                        color: ColorManager.primarywhiteColor,
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
                                        color: ColorManager.primarywhiteColor,
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
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _showDateBottomSheet(context, DateTime.now());
                        },
                        child: Container(
                          height: 410,
                          child: DateRangePickerWidget(
                            onDateRangeChanged: (dateRange) {
                              if (dateRange != null &&
                                  dateRange.start != null) {
                                _showDateBottomSheet(context, dateRange.start!);
                              }
                            },
                            doubleMonth: false,
                            theme: CalendarTheme(
                              selectedColor: ColorManager.lightBlueColor,
                              dayNameTextStyle: TextStyle(
                                  color: Colors.black45, fontSize: 12),
                              inRangeColor: Color(0xFFD9EDFA),
                              inRangeTextStyle:
                                  TextStyle(color: ColorManager.lightBlueColor),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDateBottomSheet(BuildContext context, DateTime selectedDate) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 245,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: ColorManager.primarywhiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Text(
                  ScreenTitle.kTimeSlot,
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
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
                  color: ColorManager.primarywhiteColor,
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
              SizedBox(height: 16),
              Center(
                child: Container(
                  height: 60,
                  width: 370,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ColorManager.primarydarkGreenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpPage(),
                        ),
                        ((route) => false),
                      );
                    },
                    child: Text(
                      ScreenTitle.kAppointmentRequest,
                      style: TextStyle(color: ColorManager.primarywhiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildClickableColumn(int columnIndex) {
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
                  width: 170,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: isClicked
                        ? Color(0xFF006064)
                        : ColorManager.primarywhiteColor,
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
