import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/dashboard_screen/screens/dashboard.dart';
import 'package:patient_app/presentation/refill_page/refill_pills_list.dart';

enum SingingCharacter { radios, radio1, radio2 }

class RefillDetails extends StatefulWidget {
  const RefillDetails({super.key});

  @override
  State<RefillDetails> createState() => _RefillDetailsState();
}

class _RefillDetailsState extends State<RefillDetails> {
  SingingCharacter? _character = SingingCharacter.radios;
  String _currentAppBarTitle = ScreenTitle.kRefillPage;
  double _currentSliderValue = 0;
  String? value;
  String? _selectedEmployment;

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
          body: Container(
            child: Column(
              children: [
                _buildAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        _centerImage(),
                        _LikeToRiffil(),
                        SizedBox(
                          height: 20,
                        ),
                        _radiosSelection(),
                        _bottomDeviderWidget(),
                        SizedBox(
                          height: 20,
                        ),
                        _buildTitleText(),
                        SizedBox(
                          height: 10,
                        ),
                        _searchField(),
                        SizedBox(
                          height: 10,
                        ),
                        _messageFieald(),
                        SizedBox(
                          height: 10,
                        ),
                        _elevatedButton()
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
        height: MediaQuery.of(context).copyWith().size.height / 20,
        width: MediaQuery.of(context).copyWith().size.height / 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: const Color.fromARGB(255, 231, 229, 229),
        ),
        child: IconButton(
          iconSize: 20,
          onPressed: () {
            Navigator.pop(context);
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

  Widget _centerImage() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'How Much Medication',
              style: GoogleFonts.cairo(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                  color: ColorManager.primarydarkGreenColor),
            )
          ],
        ),
      ),
    );
  }

  Widget _LikeToRiffil() {
    return Container(
        child: Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'Would You Like To Refill ?',
            style: GoogleFonts.roboto(
              fontSize: 16,
            ),
          ),
        )
      ],
    ));
  }

  Widget _radiosSelection() {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'All My Balance Medication',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            leading: Radio<SingingCharacter>(
              activeColor: ColorManager.primarydarkGreenColor,
              value: SingingCharacter.radios,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('All My Balance Medication for a selected duration',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                )),
            leading: Radio<SingingCharacter>(
              activeColor: ColorManager.primarydarkGreenColor,
              value: SingingCharacter.radio1,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'Selective Medication only',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            leading: Radio<SingingCharacter>(
              activeColor: ColorManager.primarydarkGreenColor,
              value: SingingCharacter.radio2,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomDeviderWidget() {
    return Divider(
      indent: 15,
      endIndent: 15,
    );
  }

  Widget _buildTitleText() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Text(
            'Select The Prescribing Doctor',
            style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Smith,Josh',
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.cairo(
                              fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _messageFieald() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 22,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 1,
                ),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Message to the doctor',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _elevatedButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {},
            child: Container(
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
                    offset: const Offset(4.0, 4.0),
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
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RefillPillsList()));
                  },
                  splashColor: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Select Medicines',
                      style: GoogleFonts.cairo(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
