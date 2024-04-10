import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';

class ConfirmPasswordPage extends StatefulWidget {
  const ConfirmPasswordPage({super.key});

  @override
  State<ConfirmPasswordPage> createState() => _ConfirmPasswordPageState();
}

class _ConfirmPasswordPageState extends State<ConfirmPasswordPage> {
  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          child: Column(children: [
            _buildAppBar(),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'New Password',
                  hintStyle: GoogleFonts.roboto(fontSize: 16),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.verified),
                  hintText: 'Confirm Password',
                  hintStyle: GoogleFonts.roboto(fontSize: 16),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                      onTap: () {},
                      splashColor: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Change Password',
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
            ),
          ]),
        ),
      )),
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
      'New Password',
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
}
