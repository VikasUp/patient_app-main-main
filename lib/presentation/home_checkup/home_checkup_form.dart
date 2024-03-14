import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/home_checkup/home_checkup.dart';
import 'package:patient_app/presentation/otp_screen/otp_page.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedEmployment;
  bool agree = false;

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
        child: Container(
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
                        buildHeaderText(),
                        buildForm(size),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
                _buildTransparentButton(),
              ],
            ),
          ),
        )),
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
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: const Color.fromARGB(255, 231, 229, 229),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey.withOpacity(0.8),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBarTitle() {
    return Text(
      'Book New Visit',
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

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 110,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            ScreenTitle.kBookNewVisit,
            style: GoogleFonts.cairo(
                fontSize: 18,
                color: ColorManager.primarydarkGreenColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.grey,
          size: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Image.asset(ImageSaource.kloginLogo, height: 50, width: 50))
      ],
      flexibleSpace: Container(
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

  Widget buildHeaderText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ScreenTitle.kBookAHomeVisit,
          style: GoogleFonts.roboto(fontSize: 29, fontWeight: FontWeight.w400),
        ),
        Text(
          ScreenTitle.kNow,
          style: GoogleFonts.roboto(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 127, 131),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buildForm(Size size) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildTextFormField(
              ScreenTitle.kFullName, ScreenTitle.kenterName, size),
          const SizedBox(height: 12),
          buildTextFormField(
              ScreenTitle.kEmailId, ScreenTitle.kenterEmail, size),
          const SizedBox(height: 10),
          buildTextFormField(
              ScreenTitle.knumber, ScreenTitle.kEnterNumber, size),
          const SizedBox(height: 10),
          buildTextFormField(
            ScreenTitle.kcheckupType,
            ScreenTitle.kcheckupType,
            size,
          ),
          const SizedBox(height: 10),
          buildTextFormField(
              ScreenTitle.kAddress, ScreenTitle.kEnterYourAdress, size),
          const SizedBox(height: 10),
          buildTextFormField(
              ScreenTitle.kAreaCode, ScreenTitle.kEnterAreaCode, size),
          const SizedBox(height: 10),
          buildVisitTypeSelection(size),
          buildAgreementCheckBox(),
        ],
      ),
    );
  }

  Widget buildTextFormField(String labelText, String errorText, Size size) {
    return SizedBox(
      height: 54,
      width: size.width * 0.9,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          labelText: labelText,
          filled: true,
          fillColor: Color.fromARGB(255, 237, 237, 237),
          labelStyle: GoogleFonts.cairo(color: Colors.black, fontSize: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 176, 175, 175),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 237, 237, 237),
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorText;
          }
          return null;
        },
      ),
    );
  }

  Widget buildVisitTypeSelection(Size size) {
    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose Visit Type',
            style: GoogleFonts.cairo(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildEmploymentTypeRadioButton(
                  'nurse', 'assets/images/nurse.png'),
              const SizedBox(width: 30),
              buildEmploymentTypeRadioButton(
                  'doctor', 'assets/images/doctor.png'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildEmploymentTypeRadioButton(String label, String image) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedEmployment = label;
        });
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF6F7FA),
              border: Border.all(color: Colors.grey, width: 0.8),
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Radio(
                  activeColor: Color.fromARGB(255, 0, 127, 131),
                  value: label,
                  groupValue: _selectedEmployment,
                  onChanged: (value) {
                    setState(() {
                      _selectedEmployment = value.toString();
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Image.asset(
                    image,
                    width: 90,
                    height: 62,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
          Text(
            label == 'nurse' ? 'Nurse' : 'Doctor',
            style: GoogleFonts.cairo(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAgreementCheckBox() {
    return Row(
      children: [
        Material(
          child: Checkbox(
            side: BorderSide(color: Color(0xFF006064), width: 1.5),
            activeColor: Color(0xFF006064),
            value: agree,
            onChanged: (value) {
              setState(() {
                agree = value ?? false;
              });
            },
          ),
        ),
        const Text(
          'I Agree To KAAUH T&C And Privacy Policy',
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }

  Widget buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SizedBox(
          width: 500,
          height: 65,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                showConfirmationDialog();
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 0, 127, 131),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text(
              'Book Now',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 300,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/dialogue_box.png',
                  height: 200,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Center(
                    child: Text(
                      'We Have Received Your Details. Our Customer Care Team Will Get Back To You Shortly',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => OtpPage()),
                    (route) => false,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    border: Border.all(
                      color: Color(0xFF006064),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  child: Text(
                    'OK',
                    style: GoogleFonts.cairo(
                      fontSize: 18,
                      color: Color(0xFF006064),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
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
            onTap: () {},
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
}
