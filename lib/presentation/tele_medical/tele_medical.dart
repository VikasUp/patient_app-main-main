import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/hint_strings.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/tele_medical/widgets/appointment_date_list.dart';
import 'package:patient_app/presentation/tele_medical/widgets/teli_list.dart';
import 'package:patient_app/presentation/video_call/video_call_screen.dart';
import 'package:shimmer/shimmer.dart';

class ImageModel {
  final String imageUrl;

  ImageModel({
    required this.imageUrl,
  });
}

class TeleMedicalPage extends StatefulWidget {
  const TeleMedicalPage({super.key});
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
    ImageModel(
      imageUrl: 'assets/images/dentist.png',
    ),
    ImageModel(
      imageUrl: 'assets/images/cardiology.png',
    ),
    ImageModel(
      imageUrl: 'assets/images/physician.png',
    ),
    ImageModel(
      imageUrl: 'assets/images/pediatric.png',
    ),
    ImageModel(
      imageUrl: 'assets/images/neurologist.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          alignment: Alignment(1.0, -1.0),
          image: AssetImage(ImageSaource.kString1),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 109,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(
                ImageSaource.kString5,
                height: 40,
                width: 40,
              ),
              SizedBox(
                width: 15,
              ),
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
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 115,
                    child: IconButton(
                      icon: Image.asset(
                        'assets/images/floating_action_button.png',
                        height: 50,
                        width: 50,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeleMedicalList(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(width: 9.0, height: 30.0),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          RotateAnimatedText('Specialist',
                              duration: Duration(seconds: 2)),
                          RotateAnimatedText('Doctor',
                              duration: Duration(seconds: 2)),
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
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              height: 65,
              width: MediaQuery.of(context).size.width / 1.2,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.black, width: 0.2),
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
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
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
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "View ALL",
                              style: GoogleFonts.cairo(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF006064),
                                decoration: TextDecoration.none,
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
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final imageModel = imageList[index];
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
                            border:
                                Border.all(color: Color(0xFF006064), width: 1),
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
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
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
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "View ALL",
                              style: GoogleFonts.cairo(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF006064),
                                decoration: TextDecoration.none,
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
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: ListView.separated(
                    itemCount: imagePaths.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppointmentDateList()),
                          );
                        },
                        child: showShimmer
                            ? Shimmer.fromColors(
                                baseColor: Color(0xFF006064),
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 120,
                                                  height: 20,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(height: 8),
                                                Container(
                                                  width: 80,
                                                  height: 16,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(height: 8),
                                                Container(
                                                  height: 20,
                                                  width: 120,
                                                  color: Colors.white,
                                                ),
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
                                      ),
                                      SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(width: 156),
                                          Container(
                                            width: 50,
                                            height: 10,
                                            color: Colors.green,
                                          ),
                                          SizedBox(width: 8),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.green,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Container(
                                            width: 50,
                                            height: 10,
                                            color: Colors.red,
                                          ),
                                          SizedBox(width: 8),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          imagePaths[index],
                                          height: 90,
                                          width: 90,
                                        ),
                                        SizedBox(width: 16),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                              style: GoogleFonts.roboto(
                                                  fontSize: 15),
                                            ),
                                            RatingBar.builder(
                                              initialRating: 3,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 4.0),
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
                                        ),
                                        Spacer(),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                            ImageSaource.kvideocallpng,
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(width: 186),
                                        Text(
                                          ScreenTitle.kOnline,
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 12),
                                        ),
                                        Icon(
                                          Icons.circle,
                                          color: Colors.green,
                                          size: 15,
                                        ),
                                        Text(
                                          ScreenTitle.kOffline,
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 12),
                                        ),
                                        Icon(
                                          Icons.circle,
                                          color: Colors.red,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
