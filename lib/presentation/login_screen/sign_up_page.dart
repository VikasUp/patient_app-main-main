import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/label_text.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/data/sky_strings.dart/validator_string.dart';
import 'package:patient_app/presentation/abdominal_discomfort/date_list.dart';
import 'package:patient_app/presentation/login_screen/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Image.asset(
                ImageSaource.kString5,
                height: 40,
                width: 40,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                ImageSaource.kbodyimageofapplication,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        ImageSaource.kloginLogo,
                        width: 90,
                        height: 60,
                      ),
                      SizedBox(width: 10),
                      SizedBox(height: 25),
                      Text(
                        ScreenTitle.kSignUp,
                        style: GoogleFonts.cairo(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 127, 131),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildTextFormField(
                          label: LabelString.kMedicalRecord,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ValidatorString.kmedicalNumber;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        buildTextFormField(
                          label: LabelString.kNationalId,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ValidatorString.knationalId;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        buildTextFormField(
                          label: LabelString.knumber,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ValidatorString.kphone;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        buildTextFormField(
                          label: LabelString.kEmail,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ValidatorString.kemail;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        buildTextFormField(
                          label: LabelString.kPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ValidatorString.kPassword;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        buildTextFormField(
                          label: LabelString.kConfirmPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ValidatorString.kConfirmPassword;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        buildElevatedButton(size),
                        buildRichText(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required String label,
    String? Function(String?)? validator,
  }) {
    return SizedBox(
      height: 55,
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: const Color.fromARGB(255, 227, 227, 227),
          labelStyle: const TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 209, 209, 209),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 129, 129, 129),
            ),
          ),
        ),
        validator: validator,
      ),
    );
  }

  Padding buildElevatedButton(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: 10),
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
        style: ElevatedButton.styleFrom(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          primary: Color(0xFF006064),
        ),
        child: Container(
          height: 60,
          child: Center(
            child: Text(
              ScreenTitle.kRegister,
              style: GoogleFonts.mukta(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAlertDialogContent() {
    return Container(
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
            ImageSaource.kdialougeBox,
            height: 200,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: Text(
                ScreenTitle.kdialougueText,
                style: GoogleFonts.roboto(),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                ScreenTitle.kSuccessfully,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              ScreenTitle.kAppointmentID,
              style: TextStyle(
                color: ColorManager.primarydarkGreenColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildAlertDialogActions() {
    return [
      Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => DateList()),
              (route) => false,
            );
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

  Widget buildRichText() {
    return Container(
      margin: EdgeInsets.only(bottom: 1),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
            );
          },
          child: RichText(
            text: TextSpan(
              text: ScreenTitle.kDonthaveacc,
              style: GoogleFonts.roboto(
                fontSize: 17,
                color: Colors.grey,
              ),
              children: [
                TextSpan(
                  text: ScreenTitle.kSignIn,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
