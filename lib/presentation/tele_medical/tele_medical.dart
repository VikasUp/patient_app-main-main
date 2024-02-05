import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/hint_strings.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/dashboard_screen/screens/dashboard.dart';
import 'package:patient_app/presentation/tele_medical/widgets/appointment_date_list.dart';
import 'package:patient_app/presentation/tele_medical/widgets/teli_list.dart';
import 'package:shimmer/shimmer.dart';

class ImageModel {
  final String imageUrl;

  ImageModel({required this.imageUrl});
}

class TeleMedicalPage extends StatefulWidget {
  const TeleMedicalPage({Key? key}) : super(key: key);

  @override
  _TeleMedicalPageState createState() => _TeleMedicalPageState();
}

class _TeleMedicalPageState extends State<TeleMedicalPage> {
  bool showShimmer = true;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        showShimmer = false;
      });
    });
  }

  List<String> imagePaths = [
    'assets/images/cricular_avatar.png',
    'assets/images/cricular_avatar.png',
    'assets/images/cricular_avatar.png',
    'assets/images/cricular_avatar.png',
    'assets/images/cricular_avatar.png',
  ];

  List<String> labels = [
    'Darrell Steward',
    'Darrell Steward',
    'Darrell Steward',
    'Darrell Steward',
    'Darrell Steward',
  ];

  List<String> subTitle = [
    'Dentist',
    'Dentist',
    'Dentist',
    'Dentist',
    'Dentist',
  ];

  List<ImageModel> imageList = [
    ImageModel(imageUrl: 'assets/images/dentist.png'),
    ImageModel(imageUrl: 'assets/images/cardiology.png'),
    ImageModel(imageUrl: 'assets/images/physician.png'),
    ImageModel(imageUrl: 'assets/images/pediatric.png'),
    ImageModel(imageUrl: 'assets/images/neurologist.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 109,
      automaticallyImplyLeading: false,
      title: buildAppBarTitle(),
      leading: IconButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => DashBoardScreen()),
              (route) => false);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.grey,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => TeleMedicalList(),
                ),
                (route) => false,
              );
            },
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Image.asset(
                'assets/images/floating_action_button.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
        )
      ],
      titleSpacing: 20,
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

  Widget buildAppBarTitle() {
    return Row(
      children: [
        SizedBox(width: 15),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tele Medical",
                style: GoogleFonts.cairo(
                  color: Color(0xFF006064),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget buildFloatingActionButton() {
  //   return Stack(
  //     children: [
  //       Container(
  //         height: 150,
  //         width: 180,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //       ),
  //       Positioned(
  //         top: 40,
  //         left: 115,
  //         child: IconButton(
  //           icon: Image.asset(
  //             'assets/images/floating_action_button.png',
  //             height: 50,
  //             width: 50,
  //           ),
  //           onPressed: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => TeleMedicalList(),
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget buildBody() {
    return ListView(
      physics: ScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      children: [
        buildHeaderText(),
        SizedBox(height: 38),
        buildSearchBar(),
        SizedBox(height: 16),
        buildCategorySection(),
        SizedBox(height: 16),
        buildDoctorsList(),
      ],
    );
  }

  Widget buildHeaderText() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(width: 9.0, height: 20.0),
        Text(
          'Find Your Desired',
          style: GoogleFonts.cairo(
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 9.0, height: 30.0),
        DefaultTextStyle(
          style: GoogleFonts.cairo(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            color: Color(0xFF006064),
          ),
          child: buildAnimatedText(),
        ),
      ],
    );
  }

  Widget buildAnimatedText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextKit(
          animatedTexts: [
            RotateAnimatedText('Specialist', duration: Duration(seconds: 2)),
            RotateAnimatedText('Doctor', duration: Duration(seconds: 2)),
            RotateAnimatedText(
              'With us',
              duration: Duration(seconds: 8),
            ),
          ],
          onTap: () {
            print("Tap Event");
          },
          pause: Duration(seconds: 2),
        ),
      ],
    );
  }

  Widget buildSearchBar() {
    return Card(
      elevation: 5,
      color: Colors.white,
      shadowColor: Colors.grey.withOpacity(1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: Colors.black, width: 0.3),
      ),
      child: Container(
        height: 58,
        width: MediaQuery.of(context).size.width / 1.2,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 2,
        ),
        child: Center(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: HintString.ksearch,
              hintStyle: GoogleFonts.cairo(fontSize: 16),
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                size: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCategoryHeader(),
        SizedBox(height: 16),
        buildCategoryList(),
      ],
    );
  }

  Widget buildCategoryHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Choose Category",
            style: GoogleFonts.cairo(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          buildViewAllText(),
        ],
      ),
    );
  }

  Widget buildViewAllText() {
    return Row(
      children: [
        Container(
          child: Text(
            "View ALL",
            style: GoogleFonts.cairo(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF006064),
            ),
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFF006064),
                width: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(width: 8.0),
      ],
    );
  }

  Widget buildCategoryList() {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          final imageModel = imageList[index];
          return buildCategoryItem(imageModel);
        },
      ),
    );
  }

  Widget buildCategoryItem(ImageModel imageModel) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Color(0xFFF6F7FA),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Color(0xFF006064), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageModel.imageUrl,
              width: 50,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDoctorsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDoctorsHeader(),
        buildDoctorsListView(),
      ],
    );
  }

  Widget buildDoctorsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Doctors List",
            style: GoogleFonts.cairo(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          buildViewAllText(),
        ],
      ),
    );
  }

  Widget buildDoctorsListView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500,
      child: ListView.separated(
        itemCount: imagePaths.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppointmentDateList(),
                ),
              );
            },
            child: showShimmer ? buildShimmerItem() : buildDoctorItem(index),
          );
        },
      ),
    );
  }

  Widget buildShimmerItem() {
    return Shimmer.fromColors(
      baseColor: Color(0xFF006064),
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildShimmerImage(),
            SizedBox(height: 16),
            buildShimmerDetails(),
          ],
        ),
      ),
    );
  }

  Widget buildShimmerImage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 120, height: 10, color: Colors.white),
              SizedBox(height: 8),
              Container(width: 80, height: 10, color: Colors.white),
              SizedBox(height: 8),
              Container(height: 10, width: 120, color: Colors.white),
            ],
          ),
        ),
        SizedBox(width: 16),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  Widget buildShimmerDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(width: 156),
        Container(width: 50, height: 10, color: Colors.green),
        SizedBox(width: 8),
        Container(
            width: 20,
            height: 20,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.green)),
        SizedBox(width: 8),
        Container(width: 50, height: 10, color: Colors.red),
        SizedBox(width: 8),
        Container(
            width: 20,
            height: 20,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red)),
      ],
    );
  }

  Widget buildDoctorItem(int index) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDoctorDetails(index),
          buildDoctorStatus(),
        ],
      ),
    );
  }

  Widget buildDoctorDetails(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePaths[index],
          height: 90,
          width: 90,
        ),
        SizedBox(width: 16),
        buildDoctorInfo(index),
        Spacer(),
        buildVideoCallButton(),
      ],
    );
  }

  Widget buildDoctorInfo(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labels[index],
          style: GoogleFonts.cairo(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subTitle[index],
          style: GoogleFonts.roboto(fontSize: 15),
        ),
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
          itemSize: 20,
        ),
      ],
    );
  }

  Widget buildVideoCallButton() {
    return IconButton(
      onPressed: () {},
      icon: Image.asset(
        ImageSaource.kvideocallpng,
        width: 50,
        height: 50,
      ),
    );
  }

  Widget buildDoctorStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(width: 186),
        buildOnlineStatus(),
        buildOfflineStatus(),
      ],
    );
  }

  Widget buildOnlineStatus() {
    return Row(
      children: [
        Text(
          ScreenTitle.kOnline,
          style: TextStyle(color: Colors.green, fontSize: 12),
        ),
        Icon(
          Icons.circle,
          color: Colors.green,
          size: 15,
        ),
      ],
    );
  }

  Widget buildOfflineStatus() {
    return Row(
      children: [
        Text(
          ScreenTitle.kOffline,
          style: TextStyle(color: Colors.red, fontSize: 12),
        ),
        Icon(
          Icons.circle,
          color: Colors.red,
          size: 15,
        ),
      ],
    );
  }
}
