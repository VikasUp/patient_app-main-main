import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/label_text.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/login_screen/sign_up_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color rowColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: buildBackgroundDecoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 115),
                buildLogoAndText(),
                SizedBox(height: 10),
                buildEmailTextField(),
                buildPasswordTextField(),
                buildRememberMeAndForgotPasswordRow(),
                SizedBox(height: 10),
                buildSignInButton(),
                SizedBox(height: 10),
                buildOrText(),
                SizedBox(height: 5),
                buildSocialLoginIconsRow(size),
                SizedBox(height: 60),
                buildSignUpText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBackgroundDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(ImageSaource.kbodyimageofapplication),
        fit: BoxFit.cover,
      ),
    );
  }

  Column buildLogoAndText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImageSaource.kloginLogo,
          width: 70,
          height: 70,
        ),
        SizedBox(height: 8),
        Text(
          ScreenTitle.kWelcome,
          style: GoogleFonts.cairo(
            color: Color(0xFF006064),
            fontWeight: FontWeight.w900,
            fontSize: 35,
          ),
        ),
        SizedBox(height: 7),
        Text(
          ScreenTitle.kSignInViaEmail,
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Padding buildEmailTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19, vertical: 10),
      child: TextFormField(
        decoration: buildInputDecoration(ScreenTitle.kEnterAddreess),
      ),
    );
  }

  Padding buildPasswordTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19, vertical: 10),
      child: TextFormField(
        obscureText: true,
        decoration: buildInputDecoration(LabelString.kPassword,
            suffixIcon: Icons.remove_red_eye),
      ),
    );
  }

  InputDecoration buildInputDecoration(String hintText,
      {IconData? suffixIcon}) {
    return InputDecoration(
      border: UnderlineInputBorder(borderSide: BorderSide.none),
      fillColor: Colors.grey[200],
      hintText: hintText,
      hintStyle: GoogleFonts.roboto(fontSize: 16),
      suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      filled: true,
    );
  }

  Row buildRememberMeAndForgotPasswordRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            print(ScreenTitle.kRememberMeClicked);
            setState(() {
              rowColor = Colors.green;
            });
          },
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  print(ScreenTitle.kCheckBoxClicked);
                },
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: rowColor,
                    border: Border.all(
                      color: Color(0xFF006064),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                ScreenTitle.kRemember,
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        buildForgotPasswordText(),
      ],
    );
  }

  Column buildForgotPasswordText() {
    return Column(
      children: [
        Text(ScreenTitle.kForgotPassword,
            style: GoogleFonts.roboto(fontWeight: FontWeight.w700)),
      ],
    );
  }

  ElevatedButton buildSignInButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SignUpScreen()),
          (route) => false,
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
            ScreenTitle.kSignIn,
            style: GoogleFonts.mukta(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Text buildOrText() {
    return Text(
      "OR",
      style: GoogleFonts.roboto(
        color: Colors.grey,
        fontWeight: FontWeight.w700,
        fontSize: 15,
      ),
    );
  }

  RichText buildSignUpText() {
    return RichText(
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
    );
  }

  Padding buildSocialLoginIconsRow(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildSocialIcon('https://i.postimg.cc/HxFdTLVG/google-plus.png'),
          buildSocialIcon('https://i.postimg.cc/0y4tWK3q/facebook-2.png'),
          buildSocialIcon('https://i.postimg.cc/GpsXZhwT/twitter-3.png'),
        ],
      ),
    );
  }

  Widget buildSocialIcon(String url) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.black,
          width: 0.2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Image.network(
          url,
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}
