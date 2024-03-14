import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/abdominal_discomfort/new_appointment_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:patient_app/data/sky_strings.dart/hint_strings.dart';
import 'package:patient_app/presentation/abdominal_discomfort/date_list.dart';

class AbdominalDiscomfortPage extends StatefulWidget {
  const AbdominalDiscomfortPage({Key? key}) : super(key: key);

  @override
  State<AbdominalDiscomfortPage> createState() =>
      _AbdominalDiscomfortPageState();
}

class _AbdominalDiscomfortPageState extends State<AbdominalDiscomfortPage> {
  bool isLoading = true;
  List<String> doctorNames = [
    'Darrell Steward',
    'Darrell Steward',
    'Darrell Steward',
    'Darrell Steward',
    'Darrell Steward',
  ];

  bool showShimmer = true;
  TextEditingController _searchController = TextEditingController();
  List<String> filteredLabels = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        showShimmer = false;
        filteredLabels = List.from(doctorNames);
      });
    });
  }

  void _search() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredLabels = doctorNames
          .where((label) => label.toLowerCase().contains(query))
          .toList();
    });
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
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(size),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              _buildSearchBar(size),
              const SizedBox(height: 16),
              _buildDoctorListHeader(),
              _buildDoctorList(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(Size size) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 110,
      automaticallyImplyLeading: false,
      title: _buildAppBarTitle(size),
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            _createRoute(
              destination: NewAppointmentPage(),
            ),
          );
        },
        child: Container(
            child: Icon(
          Icons.arrow_back_ios,
          color: Colors.grey,
          size: 20,
        )),
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
    );
  }

  Widget _buildAppBarTitle(Size size) {
    return Column(
      children: [
        Text(
          ScreenTitle.kTitle,
          style: GoogleFonts.cairo(
            color: Color(0xFF006064),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar(Size size) {
    return Center(
      child: showShimmer
          ? Shimmer.fromColors(
              baseColor: Color(0xFF006064),
              highlightColor: Colors.white,
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: Colors.black, width: 0.8),
                ),
                child: Container(
                  height: 55,
                  width: size.width / 1.1,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  child: Center(
                    child: TextFormField(
                      onChanged: (value) => _search(),
                      decoration: InputDecoration(
                        hintText: HintString.ksearch,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(color: Colors.black, width: 0.8),
              ),
              child: Container(
                height: 55,
                width: size.width / 1.1,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                child: Center(
                  child: TextFormField(
                    onChanged: (value) => _search(),
                    decoration: InputDecoration(
                      hintText: HintString.ksearch,
                      hintStyle: GoogleFonts.cairo(
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildDoctorListHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showShimmer
              ? Shimmer.fromColors(
                  baseColor: ColorManager.primarydarkGreenColor,
                  highlightColor: Colors.white,
                  child: Text(
                    HintString.kDoctorList,
                    style: GoogleFonts.cairo(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Text(
                  HintString.kDoctorList,
                  style: GoogleFonts.cairo(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          Row(
            children: [
              showShimmer
                  ? Shimmer.fromColors(
                      baseColor: ColorManager.primarydarkGreenColor,
                      highlightColor: Colors.white,
                      child: Container(),
                    )
                  : Container(
                      child: Text(
                        HintString.kSeeAll,
                        style: GoogleFonts.cairo(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primarydarkGreenColor,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: ColorManager.primarydarkGreenColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
              SizedBox(width: 8.0),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorList() {
    return Expanded(
      child: ListView.builder(
        itemCount: filteredLabels.length,
        itemBuilder: (context, index) {
          return showShimmer
              ? Shimmer.fromColors(
                  baseColor: ColorManager.primarydarkGreenColor,
                  highlightColor: Colors.white,
                  child: RectangularBoxWidget(
                    doctorName: filteredLabels[index],
                  ),
                )
              : RectangularBoxWidget(
                  doctorName: filteredLabels[index],
                );
        },
      ),
    );
  }
}

class RectangularBoxWidget extends StatelessWidget {
  final String doctorName;
  const RectangularBoxWidget({Key? key, required this.doctorName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Color myButtonColor = Color.fromARGB(255, 68, 180, 191);
    return Container(
      height: 250,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Color(0xFF006064), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              ImageSaource.kString4,
              height: 100,
              width: 100,
            ),
          ),
          Positioned(
            top: 0,
            left: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: GoogleFonts.cairo(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  HintString.kGeneralPractitioner,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
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
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Image.asset(
                      ImageSaource.kheart,
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      HintString.kpercentage,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 161, 245, 254),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Text(
                      HintString.kDays,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Color(0xFF006064),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  child: Center(
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.5,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DateList(),
                              ),
                              (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: myButtonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          HintString.kappointment,
                          style: GoogleFonts.cairo(
                            color: Colors.white,
                            fontSize: size.width * 0.035,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 25,
            child: Image.asset(
              ImageSaource.kloginLogo,
              height: 50,
              width: 50,
            ),
          ),
        ],
      ),
    );
  }
}
