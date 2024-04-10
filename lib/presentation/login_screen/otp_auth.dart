import 'package:flutter/material.dart';
import 'package:patient_app/presentation/login_screen/confirm_password.dart';
import 'package:patient_app/presentation/login_screen/login.dart';
import 'package:pinput/pinput.dart';

class OtpAuthenticationPage extends StatefulWidget {
  final String phoneNumber;
  const OtpAuthenticationPage({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  State<OtpAuthenticationPage> createState() => _OtpAuthenticationPageState();
}

class _OtpAuthenticationPageState extends State<OtpAuthenticationPage> {
  TextEditingController countrycode = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    _phoneNumberController.text = widget.phoneNumber;
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
    );
  }

  Widget buildBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: buildBackgroundDecoration(),
      child: SingleChildScrollView(
        child: buildContent(),
      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildLogo(),
          SizedBox(height: 25),
          buildHeaderText(),
          SizedBox(height: 10),
          buildSubHeaderText(),
          SizedBox(height: 10),
          buildPhoneNumberText(),
          SizedBox(height: 15),
          buildPinInput(),
          SizedBox(height: 15),
          buildResendOtpButton(),
          SizedBox(height: 20),
          buildNextButton(),
        ],
      ),
    );
  }

  Widget buildLogo() {
    return Image.asset(
      'assets/images/password.png',
      width: 130,
      height: 130,
    );
  }

  Widget buildHeaderText() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'OTP Verification',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget buildSubHeaderText() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          'Enter the OTP you received',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 17, color: Colors.grey),
        ),
      ),
    );
  }

  Widget buildPhoneNumberText() {
    final defaultCountryCode = '+966'; 

    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          '${defaultCountryCode} ${_phoneNumberController.text.isNotEmpty ? _phoneNumberController.text : 'No phone number entered'}',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildPinInput() {
    final defaultPinTheme = PinTheme(
      width: 80,
      height: 80,
      textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(197, 197, 197, 1)),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(7),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Pinput(
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: submittedPinTheme,
        validator: (s) {
          return s == '2222' ? null : 'Pin is incorrect';
        },
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
        onCompleted: (pin) => print(pin),
      ),
    );
  }

  Widget buildResendOtpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 27.0),
          child: TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'Resend Otp',
                  style: TextStyle(
                    color: Color(0xFF006064),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 6.0),
                Image.asset(
                  'assets/images/send.png',
                  height: 18.0,
                  width: 18.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNextButton() {
    return SizedBox(
      height: 60,
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ConfirmPasswordPage()),
          );
        },
        child: Text(
          'Next',
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
}
