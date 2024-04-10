import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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

  bool isLoading = true;

  List<String> entries = [
    'Darrell Steward',
    'Darrell Steward',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void loadData() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
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
                  child: isLoading
                      ? _buildLoadingWidget()
                      : ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10),
                          itemCount: entries.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: ListTile(
                                title: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            child: Image.asset(
                                              imagePath[
                                                  index % imagePath.length],
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
                                                style: GoogleFonts.roboto(
                                                    fontSize: 13),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                '8:00 AM',
                                                style: GoogleFonts.roboto(
                                                    fontSize: 13),
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
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 77, 212, 81),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 14,
                                                      vertical: 4),
                                                  child: Text(
                                                    'Confirmed',
                                                    style: GoogleFonts.cairo(
                                                        color: Colors.white),
                                                  ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading ? _buildLoadingWidget() : Center(child: Text('Hello')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading ? _buildLoadingWidget() : Center(child: Text('hello')),
          ],
        ),
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: LoadingAnimationWidget.dotsTriangle(
        size: 50,
        color: ColorManager.darkblueColor,
      ),
    );
  }
}
