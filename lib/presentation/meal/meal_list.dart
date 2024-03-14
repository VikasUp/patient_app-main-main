import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/dashboard_screen/screens/dashboard.dart';
import 'package:table_calendar/table_calendar.dart';

class ImageModel {
  final String imageList;
  bool isTapped;
  ImageModel({
    required this.imageList,
    this.isTapped = false,
  });
}

class MealList extends StatefulWidget {
  const MealList({super.key});
  @override
  State<MealList> createState() => _MealListState();
}

class _MealListState extends State<MealList>
    with SingleTickerProviderStateMixin {
  bool isTapped = false;
  late DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  bool isFlipped = false;
  int counter = 0;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  String _currentAppBarTitle = ScreenTitle.kComplainPage;

  List<ImageModel> imageList = [
    ImageModel(imageList: 'assets/images/Cauliflower+Samurai+Yqueue.svg'),
    ImageModel(imageList: 'assets/images/Chicken-Steak-min.svg'),
    ImageModel(imageList: 'assets/images/somthing.svg'),
  ];

  List<String> items = [
    "Home",
    "Explore",
    "Search",
    "Feed",
  ];

  List<String> stringText = [
    'BreakFast',
    'Lunch',
    'Brunch',
    'Dinner',
  ];

  List<String> text = [
    'Fried Chicken',
    'Cauliflower Samurai',
    'Panner Tikka',
  ];

  List<String> icons = [
    "assets/images/restaurant.png"
        "assets/images/restaurant.png"
        "assets/images/shrimp.png"
        " assets/images/bowl.png"
  ];
  int current = 0;
  PageController pageController = PageController();

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
                        _buildCalendar(),
                        _titleText(),
                        SizedBox(
                          height: 10,
                        ),
                        _verticlegridList(),
                        _customTabBar(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildAppBarLeading(),
        _buildAppBarTitle(),
        Spacer(),
        _buildAppBarAction(),
      ],
    );
  }

  Widget _buildAppBarLeading() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
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

  Widget _buildAppBarTitle() {
    return Text(
      _currentAppBarTitle,
      style: GoogleFonts.cairo(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: ColorManager.primarydarkGreenColor),
    );
  }

  Widget _buildAppBarAction() {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              ImageSaource.kloginLogo,
              height: 55,
              width: 55,
            )),
      ],
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
                    rowHeight: 40,
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

  Widget _titleText() {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Todays Meal',
              style:
                  GoogleFonts.cairo(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _verticlegridList() {
    return Container(
      height: 115,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imageList.length,
          itemBuilder: (BuildContext context, int index) {
            final imageModel = imageList[index];
            return buildCategoryItem(imageModel);
          },
        ),
      ),
    );
  }

  Widget buildCategoryItem(ImageModel imageModel) {
    return InkWell(
      onTap: () {
        setState(() {
          for (var model in imageList) {
            model.isTapped = (model == imageModel);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: imageModel.isTapped ? Color(0xFFF2F6FC) : Color(0xFFF2F6FC),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: imageModel.isTapped ? Color(0xFF0B7D8A) : Colors.transparent,
            width: 1.0,
          ),
        ),
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imageModel.imageList,
                width: 50,
                height: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${stringText[current]}",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customTabBar() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _tabBar(),
          _tabBarBody(),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      height: 60.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return _tabBarItem(index);
        },
      ),
    );
  }

  Widget _tabBarItem(int index) {
    bool isSelected = current == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          current = index;
        });
        pageController.animateToPage(
          current,
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: _tabBarItemDecoration(index, isSelected),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: isSelected
                      ? Colors.white
                      : ColorManager.primarydarkGreenColor,
                  child: Icon(
                    Icons.pedal_bike_rounded,
                    color: isSelected
                        ? ColorManager.primarydarkGreenColor
                        : Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                items[index],
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : _tabBarItemColor(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Decoration _tabBarItemDecoration(int index, bool isSelected) {
    return BoxDecoration(
      color: isSelected ? Color(0xFF0B7D8A) : Color(0xFFF2F6FC),
      border: Border.all(
        color: isSelected ? Color(0xFFF2F6FC) : Color(0xFF0B7D8A),
        width: 0.9,
      ),
      borderRadius: BorderRadius.circular(9),
    );
  }

  Color _tabBarItemColor(int index) {
    return current == index
        ? ColorManager.primarydarkGreenColor
        : ColorManager.primarydarkGreenColor;
  }

  Widget _tabBarBodyItem(int index) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 132.5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            left: 20,
            child: Container(
              height: 180,
              width: 1000,
              decoration: BoxDecoration(
                color: Color(0xFFF6F7FA),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            top: -2,
            left: 40,
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/Chicken-Steak-min.svg',
                  fit: BoxFit.fill,
                ),
                Text(
                  text[index],
                  textAlign: TextAlign.start,
                  style: GoogleFonts.cairo(
                      color: ColorManager.primarydarkGreenColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 35,
            bottom: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      'Kcal',
                      style: GoogleFonts.cairo(
                          color: ColorManager.primarydarkGreenColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  '130',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
                Row(
                  children: [
                    Text(
                      'Rice, Pasta \nWater Included',
                      style: GoogleFonts.cairo(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Ink(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isFlipped = !isFlipped;
                            isFlipped
                                ? _controller.forward()
                                : _controller.reverse();
                          });
                        },
                        child: Row(
                          children: [
                            AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                return Transform(
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001)
                                    ..rotateX(_animation.value * 3.141),
                                  alignment: Alignment.center,
                                  child: child,
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 8),
                                decoration: BoxDecoration(
                                  color: isFlipped
                                      ? Colors.white
                                      : Color(0xFF0A727D),
                                  border: isFlipped
                                      ? Border.all(
                                          color: ColorManager
                                              .primarydarkGreenColor)
                                      : null,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: isFlipped
                                            ? ColorManager.primarydarkGreenColor
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 15,
                                        color: isFlipped
                                            ? Colors.white
                                            : ColorManager
                                                .primarydarkGreenColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 1),
                                      child: Text(
                                        isFlipped ? '$counter' : 'Add',
                                        style: GoogleFonts.cairo(
                                          color: isFlipped
                                              ? ColorManager
                                                  .primarydarkGreenColor
                                              : Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabBarBody() {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      height: 400.0,
      child: ListView.builder(
        itemCount: 3,
        controller: pageController,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          return _tabBarBodyItem(index);
        },
      ),
    );
  }
}
