import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/hint_strings.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/abdominal_discomfort/new_appointment_screen.dart';

class AppointementPage extends StatefulWidget {
  const AppointementPage({Key? key}) : super(key: key);

  @override
  _AppointementPageState createState() => _AppointementPageState();
}

class _AppointementPageState extends State<AppointementPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  List<String> imagePath = [
    'assets/images/cricular_avatar.png',
    'assets/images/cricular_avatar.png',
  ];

  List<String> entries = [
    'Darrell Steward',
    'Darrell Steward',
  ];

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

  Route _createRoute({required Widget destination}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;

    return Container(
      decoration: BoxDecoration(
        color: ColorManager.primarywhiteColor,
        image: DecorationImage(
          alignment: Alignment(1.0, -1.0),
          image: AssetImage(ImageSaource.kString1),
        ),
      ),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _buildAppBar(context),
          body: _buildTabBarView(),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            HintString.kYourAppointment,
            style: GoogleFonts.cairo(
              color: ColorManager.primarydarkGreenColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.grey,
            )),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewAppointmentPage(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              ImageSaource.kfloatingactionbutton,
              height: 45,
              width: 45,
            ),
          ),
        )
      ],
      bottom: _buildTabBar(),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: [
        Tab(text: ScreenTitle.kUpcoming),
        Tab(text: ScreenTitle.kComplete),
        Tab(text: ScreenTitle.kCancel),
      ],
      indicatorColor: Color(0xFF006064),
      labelStyle: GoogleFonts.cairo(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      unselectedLabelStyle: TextStyle(color: Colors.grey),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(
                                        imagePath[index % imagePath.length],
                                        height: double.infinity,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        entries[index],
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          'Monday, October 24',
                                          style:
                                              GoogleFonts.roboto(fontSize: 13),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          '8:00 AM',
                                          style:
                                              GoogleFonts.roboto(fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 11,
                                      ),
                                      Text(
                                        '30 Min Ago',
                                        style: GoogleFonts.cairo(
                                            fontSize: 13,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 77, 212, 81),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            'Confirmed',
                                            style: GoogleFonts.cairo(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      indent: 105,
                      thickness: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(child: Text('Content for Completed Appointments')),
        Center(child: Text('Content for Cancelled Appointments')),
      ],
    );
  }

  // Widget _buildBottomSheet(BuildContext context) {
  //   return Container(
  //     decoration: BoxDecoration(color: Colors.white),
  //     child: Center(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Image.asset(
  //             ImageSaource.kbookappointmentimg,
  //             height: 250,
  //           ),
  //           SizedBox(height: 20),
  //           Text(
  //             ScreenTitle.kYoudonthaveappointment,
  //             style: GoogleFonts.cairo(
  //               fontSize: 16,
  //               color: Colors.black,
  //             ),
  //           ),
  //           SizedBox(height: 20),
  //           _buildElevatedButton(context),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildElevatedButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => NewAppointmentPage(),
            ),
            (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          primary: ColorManager.primarydarkGreenColor,
          onPrimary: Colors.white,
          minimumSize: Size(300, 58),
        ),
        child: Text(
          ScreenTitle.kbookappointment,
          style: GoogleFonts.cairo(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
