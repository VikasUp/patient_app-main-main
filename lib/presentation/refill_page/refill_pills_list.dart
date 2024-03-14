import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';

class RefillPillsList extends StatefulWidget {
  const RefillPillsList({super.key});
  @override
  State<RefillPillsList> createState() => _RefillPillsListState();
}

class _RefillPillsListState extends State<RefillPillsList> {
  String? value;
  bool isButtonVisible = true;
  List<int> count = List.filled(7, 0);
  List<String> selectedMedicines = [];

  List<String> imagePath = [
    'assets/images/tablet.png',
    'assets/images/capsule.png',
    'assets/images/capsule2.png',
    'assets/images/sickness.png',
    'assets/images/sickness.png',
    'assets/images/tablet.png',
    'assets/images/capsule.png',
    'assets/images/capsule2.png',
    'assets/images/sickness.png',
    'assets/images/sickness.png',
  ];

  List<String> entries = [
    'Paracetamol XI 2',
    'Dpp-4 Inhibitors',
    'Amrinone',
    'Amrinone',
    'Paracetamol XI 2',
    'Dpp-4 Inhibitors',
    'Amrinone',
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
          body: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification) {
                if (scrollNotification.scrollDelta! > 0) {
                  if (isButtonVisible) {
                    setState(() {
                      isButtonVisible = false;
                    });
                  }
                } else {
                  if (!isButtonVisible) {
                    setState(() {
                      isButtonVisible = true;
                    });
                  }
                }
              }
              return true;
            },
            child: Stack(
              children: [
                Column(
                  children: [
                    _buildAppBar(),
                    _centerImage(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildMedicineList(),
                            SizedBox(
                              height: 120,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (isButtonVisible) _buildTransparentButton()
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
            ScreenTitle.kRefillPage,
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

  Widget _centerImage() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Select Medicine For Refill',
            style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget _buildMedicineList() {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: 7,
      itemBuilder: (BuildContext context, int index) {
        return _buildMedicineCard(index);
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 20,
      ),
    );
  }

  _buildMedicineCard(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 72),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildMedicineLeading(index),
                const SizedBox(
                  width: 20,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 65,
                  ),
                  child: Container(
                    color: ColorManager.greyColor,
                    width: 1,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                _buildMedicineTitle(index),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMedicineTitle(int index) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  entries[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
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
                              color: Color(0xFF006064),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          _buildCounterButtons(index),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _buildCounterButtons(int index) {
    return Row(
      children: [
        _buildRoundedButton(Icons.remove, () {
          setState(() {
            if (count[index] > 0) {
              count[index]--;
            }
          });
        }),
        SizedBox(width: 10),
        Text(
          '${count[index]}',
          style: GoogleFonts.cairo(
            fontSize: 11,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        _buildRoundedButton(Icons.add, () {
          setState(() {
            count[index]++;
          });
        }),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFD3FFE1),
              border: Border.all(
                  color: ColorManager.primarydarkGreenColor, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Add',
                style: GoogleFonts.roboto(
                  color: ColorManager.primarydarkGreenColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRoundedButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFECECEC),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 20,
            color: ColorManager.primarydarkGreenColor,
          ),
        ),
      ),
    );
  }

  Widget _buildMedicineLeading(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Image.asset(
            imagePath[index],
            width: 50,
            height: 50,
          ),
          SizedBox(height: 10),
          Text(' Pills'),
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white.withOpacity(0.5),
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Text('Selected Medicines X1 2'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '(500 mg)',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '5 Tablet',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          DottedLine(
                            lineThickness: 0.6,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Row(
                              children: [
                                Text('Selected Medicines X2 2'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '(500 mg)',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '5 Tablet',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          DottedLine(
                            lineThickness: 0.6,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Row(
                              children: [
                                Text('Selected Medicines X1 2'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '(500 mg)',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '5 Tablet',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          DottedLine(
                            lineThickness: 0.6,
                            dashColor: Colors.grey,
                          ),
                          for (String medicine in selectedMedicines)
                            Text(medicine),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF0B7F8C),
                                  ColorManager.primarydarkGreenColor,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: buildAlertDialogContent(),
                                      actions: buildAlertDialogActions(),
                                    );
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 48, vertical: 10),
                                child: Text(
                                  "Submit Refill Request",
                                  style: GoogleFonts.cairo(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                shadowColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: double.infinity,
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
                    offset: const Offset(
                      4.0,
                      4.0,
                    ),
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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 17,
                  ),
                  child: Text(
                    'Submit Refill Request',
                    style: GoogleFonts.cairo(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAlertDialogContent() {
    return Container(
      height: 400,
      width: 550,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Hero(
              tag: 'correct_image',
              child: SvgPicture.asset(
                'assets/images/correct.svg',
                fit: BoxFit.contain,
                height: 80,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Your Medicine Refiling Request Has Been\nRegistered Successfully\nOur team willGet Back To You Shortly.',
              style: GoogleFonts.roboto(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Row(
                children: [
                  Text(
                    'Selected Medicines X1 2',
                    style: GoogleFonts.roboto(fontSize: 12),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '(500 mg)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '5 Tablet',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
            DottedLine(
              lineThickness: 0.6,
              dashColor: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Row(
                children: [
                  Text(
                    'Selected Medicines X1 2',
                    style: GoogleFonts.cairo(fontSize: 12),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '(500 mg)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '5 Tablet',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
            DottedLine(
              lineThickness: 0.6,
              dashColor: Colors.grey,
            ),
            Row(
              children: [
                Text('Selected Medicines X1 2'),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '(500 mg)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '5 Tablet',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                )
              ],
            ),
            DottedLine(
              lineThickness: 0.5,
              dashColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildAlertDialogActions() {
    return [
      Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              border: Border.all(
                color: ColorManager.primarydarkGreenColor,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            child: Text(
              ScreenTitle.kOk,
              style: GoogleFonts.cairo(
                fontSize: 18,
                color: ColorManager.primarydarkGreenColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ];
  }
}
