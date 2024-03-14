import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/presentation/blood_request/blood_request.dart';
import 'package:patient_app/presentation/dashboard_screen/screens/dashboard.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/abdominal_discomfort/new_appointment_screen.dart';

class BloodRequestPage extends StatefulWidget {
  const BloodRequestPage({Key? key}) : super(key: key);

  @override
  _BloodRequestPageState createState() => _BloodRequestPageState();
}

class _BloodRequestPageState extends State<BloodRequestPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  List<String> imagePath = [
    'assets/images/cricular_avatar.png',
    'assets/images/cricular_avatar.png',
  ];

  List<String> entries = [
    'Barendi Russell',
    'Barrendi Russell',
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
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            ScreenTitle.kBloodRequest,
            style: GoogleFonts.cairo(
              color: ColorManager.primarydarkGreenColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      leading: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: const Color.fromARGB(255, 231, 229, 229),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: IconButton(
              iconSize: 20,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashBoardScreen(),
                  ),
                  (route) => false,
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
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => BloodRequestDonorPage(),
              ),
              (route) => false,
            );
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              ImageSaource.kfloatingactionbutton,
              height: 50,
              width: 50,
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
        Tab(text: ScreenTitle.kRequest),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 65,
                                        width: 55,
                                        child: CircleAvatar(
                                          backgroundColor: const Color.fromARGB(
                                              255, 161, 209, 211),
                                          child: Text(
                                            'O+',
                                            style: GoogleFonts.roboto(
                                              color: ColorManager
                                                  .primarydarkGreenColor,
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            'In Progress',
                                            style: GoogleFonts.cairo(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ],
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
                                          '+966-589-658-4589',
                                          style:
                                              GoogleFonts.roboto(fontSize: 13),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          'Blood Units : 2',
                                          style:
                                              GoogleFonts.roboto(fontSize: 13),
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/calendar.png',
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '16 jan 2022',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                VerticalDivider(
                                                  color: Colors.black,
                                                ), // Add VerticalDivider here
                                                Row(
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            child: TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                "02:30 PM",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 11,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
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
