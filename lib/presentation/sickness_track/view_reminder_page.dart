import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/dashboard_screen/screens/dashboard.dart';
import 'package:patient_app/presentation/sickness_track/sickness_detail_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class ViewReminderPage extends StatefulWidget {
  const ViewReminderPage({Key? key}) : super(key: key);

  @override
  State<ViewReminderPage> createState() => _ViewReminderPageState();
}

class _ViewReminderPageState extends State<ViewReminderPage>
    with TickerProviderStateMixin {
  late DateTime today = DateTime.now();
  late final TabController _tabController;

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> imagePath = [
    'assets/images/tablet.png',
    'assets/images/capsule.png',
    'assets/images/capsule2.png',
    'assets/images/sickness.png',
  ];

  List<String> entries = [
    'Paracetamol XI 2',
    'Dpp-4 Inhibitors',
    'Amrinone',
  ];

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
                          _buildCalendar(),
                          SizedBox(
                            height: 20,
                          ),
                          _buildTabs(),
                          SizedBox(height: 20),
                          _buildMedicineList(),
                          SizedBox(height: 20),
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

  Container _buildCalendar() {
    return Container(
      child: Column(
        children: [
          Center(
            child: Row(
              children: [
                Expanded(
                  child: TableCalendar(
                    pageAnimationEnabled: true,
                    headerVisible: true,
                    firstDay: DateTime.utc(2023, 1, 1),
                    lastDay: DateTime.utc(2024, 12, 31),
                    focusedDay: DateTime.now(),
                    calendarFormat: CalendarFormat.week,
                    calendarStyle: CalendarStyle(
                      markerMargin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 20,
                      ),
                      rangeHighlightColor: ColorManager.primarydarkGreenColor,
                      isTodayHighlighted: true,
                      selectedDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.primarydarkGreenColor,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      headerPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      rightChevronVisible: false,
                      leftChevronVisible: false,
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
                    rowHeight: 48,
                    daysOfWeekVisible: true,
                    onDaySelected: _onDaySelected,
                    availableGestures: AvailableGestures.all,
                    selectedDayPredicate: (day) => isSameDay(day, today),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Container _buildTabs() {
    return Container(
      child: DefaultTabController(
        length: 3,
        child: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Today'),
            Tab(text: 'Week'),
            Tab(text: 'Month'),
          ],
          labelColor: Colors.black,
          labelStyle: GoogleFonts.cairo(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: GoogleFonts.cairo(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          indicatorColor: ColorManager.primarydarkGreenColor,
        ),
      ),
    );
  }

  Container _buildMedicineList() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Today Medicine',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            _buildMedicineListView(),
          ],
        ),
      ),
    );
  }

  ListView _buildMedicineListView() {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildMedicineCard(index);
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 10,
      ),
    );
  }

  Card _buildMedicineCard(int index) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SicknessDetailScreen(),
            ),
          );
        },
        child: ListTile(
          title: _buildMedicineTitle(index),
          leading: _buildMedicineLeading(index),
          contentPadding: EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: 16.0,
          ),
        ),
      ),
    );
  }

  Column _buildMedicineTitle(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              entries[index],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildMedicineQuantityButton(index),
          ],
        ),
        _buildMedicineActionButtons(),
      ],
    );
  }

  Row _buildMedicineQuantityButton(int index) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Container(
                child: Text(
                  "500 mg",
                  style: GoogleFonts.cairo(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 8.0),
            ],
          ),
        ),
      ],
    );
  }

  Container _buildMedicineActionButtons() {
    return Container(
      child: Row(
        children: [
          _buildMedicineActionButton('Today Medicine', Color(0xFFC2F9FF)),
          SizedBox(
            width: 10,
          ),
          _buildMedicineActionButton('View Reminders', Color(0xFFCDDDFF)),
        ],
      ),
    );
  }

  Container _buildMedicineActionButton(String text, Color backgroundColor) {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: IconButton(
        icon: Center(
          child: Text(
            text,
            style: GoogleFonts.cairo(
              fontSize: 11,
              color: text == 'Today Medicine'
                  ? ColorManager.primarydarkGreenColor
                  : Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Column _buildMedicineLeading(int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          child: Image.asset(
            imagePath[index % imagePath.length],
            width: 40,
            height: 40,
          ),
        ),
        Text(
          '1Pills/Day',
          style: GoogleFonts.roboto(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 20),
        VerticalDivider(
          width: 5,
          thickness: 1,
          color: Colors.black,
        ),
        SizedBox(width: 10),
      ],
    );
  }

  Column _buildScreenTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Sickness Track',
              style: GoogleFonts.cairo(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorManager.primarydarkGreenColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Padding _buildBackButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                builder: (context) => DashBoardScreen(),
              ),
            );
          },
          icon: Container(
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }

  IconButton _buildUserIconButton() {
    return IconButton(
      onPressed: () {},
      icon: Image.asset(
        ImageSaource.kloginLogo,
        height: 55,
        width: 55,
      ),
    );
  }
}
