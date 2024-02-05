import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/hint_strings.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';

class DoctorBio extends StatefulWidget {
  const DoctorBio({Key? key}) : super(key: key);

  @override
  State<DoctorBio> createState() => _DoctorBioState();
}

class _DoctorBioState extends State<DoctorBio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildSlivers(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            ImageSaource.kString5,
            height: 40,
            width: 40,
          ),
          buildTitleColumn(),
          IconButton(
            icon: Image.asset(
              ImageSaource.kloginLogo,
              height: 50,
              width: 50,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget buildTitleColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ScreenTitle.kDoctorBio,
          style: GoogleFonts.cairo(
            color: Color(0xFF006064),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget buildSlivers() {
    return CustomScrollView(
      slivers: [
        buildDoctorInfo(),
        buildDivider(10),
        buildSpeciality(),
        buildAchievements(),
        buildDivider(10),
        buildBiography(),
        buildDivider(10),
        buildProfessionalJourney(),
        buildProfessionalJourneyList(),
      ],
    );
  }

  Widget buildDoctorInfo() {
    return SliverToBoxAdapter(
      child: Container(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ScreenTitle.kDoctorName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    ScreenTitle.kGeneralPractitioner,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  buildDoctorDetails(),
                  SizedBox(height: 16.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDoctorDetails() {
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
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => DoctorBio()),
              (route) => false,
            );
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          ),
          child: Text(
            ScreenTitle.kyears,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
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

  Widget buildDivider(double height) {
    return SliverToBoxAdapter(
      child: SizedBox(height: height),
    );
  }

  Widget buildSpeciality() {
    return SliverToBoxAdapter(
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text(
                ScreenTitle.kSpecialityin,
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildAchievements() {
    return SliverToBoxAdapter(
      child: buildCategory('Achievements', [
        'Arab Board in General Surgery',
        'Arab Board in General Surgery',
        'Arab Board in General Surgery',
        'Arab Board in General Surgery',
        'Arab Board in General Surgery',
      ]),
    );
  }

  Widget buildCategory(String title, List<String> items) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Image.asset(
                  'assets/images/badge.png',
                  width: 20,
                  height: 35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  title,
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          buildAchievementList(items),
        ],
      ),
    );
  }

  Widget buildAchievementList(List<String> items) {
    return Column(
      children: items.map((item) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              ),
            ),
            Text(
              item,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget buildBiography() {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Image.asset(
                    'assets/images/biography.png',
                    width: 50,
                    height: 35,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    'Biography',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      'Dr Darrell Steward it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout./n The Point of using Lorem Ipsum is that it has a more-or-less normaml distrubution of letters, as opposed to using ',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfessionalJourney() {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Image.asset(
                    'assets/images/customer-journey.png',
                    width: 50,
                    height: 35,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Professional Journey',
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfessionalJourneyList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: buildProfessionalJourneyItem(),
          );
        },
        childCount: 3,
      ),
    );
  }

  Widget buildProfessionalJourneyItem() {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: Container(
                  color: Color(0xFF006064),
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      ScreenTitle.kcardHeading2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      ScreenTitle.kCardHeading,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            border: Border.all(color: Color(0xFF006064)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      HintString.khowmanyear,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  ScreenTitle.kUniversityname,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  ScreenTitle.kheadtingText1,
                  style: GoogleFonts.roboto(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
