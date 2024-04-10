import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:patient_app/presentation/login_screen/login.dart';
import 'package:patient_app/presentation/login_screen/sign_up_page.dart';
import 'package:patient_app/presentation/otp_screen/otp_verify.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController countrycode = TextEditingController();

  @override
  void initState() {
    countrycode.text = "+966";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 50,
      automaticallyImplyLeading: false,
      title: Text(''),
      leading: buildBackIconButton(),
    );
  }

  IconButton buildBackIconButton() {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios,  
        color: Colors.grey,
        size: 25,
      ),
    );
  }

  Widget buildBody() {
    return Container(
      decoration: buildBackgroundDecoration(),
      child: buildContent(),
    );
  }

  BoxDecoration buildBackgroundDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/authentication_background.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildLogo(),
          SizedBox(height: 20),
          buildWelcomeText(),
          SizedBox(height: 10),
          buildLoginViaOtpText(),
          SizedBox(height: 25),
          buildPhoneNumberInput(),
          SizedBox(height: 20),
          buildOtpInfoText(),
          SizedBox(height: 30),
          buildLoginButton(),
          SizedBox(height: 30),
          buildOrText(),
          SizedBox(height: 1),
          buildLoginViaEmailButton(),
          buildSpacer(),
          buildSignUpLink(),
        ],
      ),
    );
  }

  Widget buildLogo() {
    return Image.asset(
      'assets/images/login_logo.png',
      width: 90,
      height: 90,
    );
  }

  Widget buildWelcomeText() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Welcome',
        style: GoogleFonts.cairo(
          fontWeight: FontWeight.w900,
          color: Color(0xFF006064),
          fontSize: 25,
        ),
      ),
    );
  }

  Widget buildLoginViaOtpText() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Log in via otp ',
        style: GoogleFonts.roboto(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget buildPhoneNumberInput() {
    return Column(
      children: [
        buildPhoneNumberLabel(),
        SizedBox(height: 5),
        buildPhoneNumberRow(),
      ],
    );
  }

  Widget buildPhoneNumberLabel() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Text(
          'Phone Number',
          textAlign: TextAlign.left,
          style: GoogleFonts.cairo(
            fontSize: 15,
            color: const Color.fromARGB(255, 100, 99, 99),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget buildPhoneNumberRow() {
    return Container(
      height: 55,
      decoration: buildPhoneNumberDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildIntlPhoneNumberInput(),
          SizedBox(width: 20),
          buildDivider(),
          SizedBox(width: 10),
          buildExpandedTextField(),
        ],
      ),
    );
  }

  BoxDecoration buildPhoneNumberDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border(
        bottom: BorderSide(
          color: Color.fromARGB(255, 92, 92, 92),
          width: 1.7,
        ),
      ),
    );
  }

  Padding buildIntlPhoneNumberInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: 110,
        child: InternationalPhoneNumberInput(
          initialValue: PhoneNumber(isoCode: 'SA', dialCode: '966'),
          onInputChanged: (PhoneNumber number) {},
          inputDecoration: InputDecoration(
            border: InputBorder.none,
          ),
          selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
        ),
      ),
    );
  }

  Widget buildDivider() {
    return Text(
      "|",
      style: TextStyle(fontSize: 33, color: Colors.grey),
    );
  }

  Widget buildExpandedTextField() {
    return Expanded(
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget buildOtpInfoText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Text(
          'A 4 digit OTP will be sent via SMS to verify your mobile number!',
          textAlign: TextAlign.left,
          style: GoogleFonts.roboto(fontSize: 15, color: Colors.grey),
        ),
      ),
    );
  }

  Widget buildLoginButton() {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => VerifyOtpPage()),
            (route) => false,
          );
        },
        child: Text(
          'Log in',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF006064),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget buildOrText() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Or',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget buildLoginViaEmailButton() {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false,
          );
        },
        child: Text(
          'Login via Email',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget buildSpacer() {
    return Spacer();
  }

  Widget buildSignUpLink() {
    return Container(
      margin: EdgeInsets.only(bottom: 1),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()),
              (route) => false,
            );
          },
          child: RichText(
            text: TextSpan(
              text: "Don't have an account? ",
              style: GoogleFonts.roboto(
                fontSize: 17,
                color: Colors.grey,
              ),
              children: [
                TextSpan(
                  text: "Sign Up",
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
