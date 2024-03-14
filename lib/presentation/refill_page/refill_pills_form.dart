import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_app/presentation/refill_page/refill_details.dart';

class RefillPillsForm extends StatefulWidget {
  const RefillPillsForm({super.key});
  @override
  State<RefillPillsForm> createState() => _RefillPillsFormState();
}

class _RefillPillsFormState extends State<RefillPillsForm> {
  String _currentAppBarTitle = ScreenTitle.kRefillPage;
  double _currentSliderValue = 0;
  String? value;
  String? _selectedEmployment;
  @override
  void initState() {
    super.initState();
    _currentAppBarTitle = ScreenTitle.kRefillPage;
  }

  Future<void> _pickFile(String pageType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      print('Selected file for $pageType: ${file.name}');
    } else {
      print('File picking canceled');
    }
  }

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
                        _centerImage(),
                        _buildRaiseRequestFor(),
                        _buildPatientDetailsForm(Size.infinite),
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
          const SizedBox(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Add Patient Detail',
              style:
                  GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 27),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRaiseRequestFor() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Row(
            children: [
              _buildRadioButton('Self'),
              SizedBox(
                width: 50,
              ),
              _buildRadioButton('Others'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRadioButton(String option) {
    return InkWell(
      onTap: () {
        setState(() {
          value = option;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 238, 238),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(option,
                  style: GoogleFonts.cairo(
                      fontSize: 16, fontWeight: FontWeight.w400)),
              InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  setState(() {
                    value = option;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    child: Radio(
                      activeColor: ColorManager.primarydarkGreenColor,
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => ColorManager.primarydarkGreenColor,
                      ),
                      focusColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green,
                      ),
                      groupValue: value,
                      value: option,
                      visualDensity: VisualDensity.compact,
                      onChanged: (value) {
                        setState(() {
                          this.value = value.toString();
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPatientDetailsForm(Size size) {
    return Column(
      children: [
        SizedBox(height: 20),
        _buildTextFormField('Patient Name'),
        SizedBox(height: 20),
        _buildNumberTextFormField('Phone'),
        SizedBox(height: 20),
        _buildTextFormField('Email'),
        SizedBox(height: 20),
        _buildRequestForLabel(),
        SizedBox(height: 10),
        buildVisitTypeSelection(size),
        SizedBox(
          height: 10,
        ),
        buildContinueElevatedButton(),
      ],
    );
  }

  Widget _buildTextFormField(String labelText, {String prefixText = ''}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: SizedBox(
        height: 62,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: labelText,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            filled: true,
            fillColor: Color.fromARGB(255, 237, 237, 237),
            labelStyle: GoogleFonts.cairo(
              color: Colors.black,
              fontSize: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: ColorManager.primarydarkGreenColor,
              ),
            ),
            prefixText: prefixText,
            prefixStyle: GoogleFonts.cairo(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNumberTextFormField(String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 62,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            filled: true,
            fillColor: Color.fromARGB(255, 237, 237, 237),
            hintStyle: GoogleFonts.cairo(
              color: Colors.black,
              fontSize: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: ColorManager.primarydarkGreenColor,
              ),
            ),
            prefixText: '+966-',
            prefixStyle: GoogleFonts.cairo(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRequestForLabel() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Text(
              'Upload Priscription Sheet',
              style:
                  GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildVisitTypeSelection(Size size) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildEmploymentTypeRadioButton(
                text: 'Front Page',
                onUploadPressed: () => _pickFile('Front Page'),
              ),
              const SizedBox(width: 20),
              buildEmploymentTypeRadioButton(
                text: 'Back Page',
                onUploadPressed: () => _pickFile('Back Page'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildEmploymentTypeRadioButton(
      {required String text, VoidCallback? onUploadPressed}) {
    return GestureDetector(
      onTap: onUploadPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            DottedBorder(
              color: Color(0xFF0A737E),
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(6),
              child: ClipRect(
                child: Container(
                  height: 115,
                  width: 116,
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F7FA),
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: SvgPicture.asset(
                                "assets/images/upload.svg",
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(text ?? ''),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContinueElevatedButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RefillPillsForm()));
            },
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
                            builder: (context) => RefillDetails()));
                  },
                  splashColor: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Continue',
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
