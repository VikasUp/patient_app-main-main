import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/hint_strings.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/otp_screen/otp_page.dart';
import 'package:table_calendar/table_calendar.dart';

class DateList extends StatefulWidget {
  const DateList({Key? key}) : super(key: key);
  @override
  State<DateList> createState() => _DateListPageState();
}

class _DateListPageState extends State<DateList> {
  late DateTime today = DateTime.now();
  bool containerClicked = false;
  int selectedColumn = 0;

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

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
                          buildBody(),
                          SizedBox(
                            height: 130,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              _buildTransparentButton()
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
            ScreenTitle.kDentistList,
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

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildDoctorInfoContainer(),
          buildTableCalendar(),
          SizedBox(
            height: 10,
          ),
          buildTimeSlotContainer(),
          buildTimeSlotRows(),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Container buildDoctorInfoContainer() {
    return Container(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              ImageSaource.kString4,
              height: 100,
              width: 100,
            ),
            SizedBox(width: 16.0),
            buildDoctorInfoTextColumn(),
          ],
        ),
      ),
    );
  }

  Column buildDoctorInfoTextColumn() {
    return Column(
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
        buildDoctorInfoRow(),
        SizedBox(height: 16.0),
      ],
    );
  }

  Row buildDoctorInfoRow() {
    return Row(
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
    );
  }

  Padding buildTableCalendar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TableCalendar<DateTime>(
        pageAnimationEnabled: false,
        headerVisible: true,
        firstDay: DateTime.utc(2023, 1, 1),
        lastDay: DateTime.utc(2024, 12, 31),
        focusedDay: DateTime.now(),
        calendarFormat: CalendarFormat.month,
        calendarStyle: CalendarStyle(
          markerSize: 30,
          markerMargin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          rangeHighlightScale: 10,
          rangeHighlightColor: ColorManager.primarydarkGreenColor,
          isTodayHighlighted: true,
          selectedDecoration: BoxDecoration(
            border: const Border.fromBorderSide(
              const BorderSide(
                color: ColorManager.primarydarkGreenColor,
              ),
            ),
            shape: BoxShape.circle,
            color: ColorManager.primarydarkGreenColor,
          ),
        ),
        headerStyle: HeaderStyle(
          titleCentered: true,
          headerPadding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          rightChevronVisible: true,
          leftChevronVisible: true,
          formatButtonShowsNext: false,
          formatButtonVisible: false,
          titleTextStyle: GoogleFonts.roboto(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
          ),
        ),
        rowHeight: 49,
        daysOfWeekVisible: true,
        onDaySelected: _onDaySelected,
        availableGestures: AvailableGestures.all,
        selectedDayPredicate: (day) => isSameDay(day, today),
      ),
    );
  }

  Container buildTimeSlotContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimeSlotColumn(),
        ],
      ),
    );
  }

  Column _buildTimeSlotColumn() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
          ),
          child: Text(
            ScreenTitle.kTimeSlot,
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ),
      ],
    );
  }

  Container buildTimeSlotRows() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildClickableColumn(1, '10:00 AM : 5:00 PM '),
              buildClickableColumn(2, '11:00 AM : 5:00 PM'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildClickableColumn(3, '12:00 PM : 5:00 PM'),
              buildClickableColumn(4, '1:00 PM : 5:00 PM'),
            ],
          ),
        ],
      ),
    );
  }

  Container buildClickableColumn(int columnIndex, String columnText) {
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
                        columnText,
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

  Widget _buildTransparentButton() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtpPage()));
                    },
                    splashColor: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 17),
                      child: Text(
                        'Send Appointment Request',
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
      ),
    );
  }
}
