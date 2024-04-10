import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/login_screen/otp_auth.dart';
import 'package:patient_app/utils/app_routes.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _phoneNumber = '';

  bool isValidPhoneNumber(String value) {
    final RegExp regex = RegExp(r'^[0-9]+$');
    if (!regex.hasMatch(value)) {
      return false;
    }

    return value.length >= 10;
  }

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                _buildAppBar(),
                SizedBox(height: 200),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Please enter your phone number to reset password',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        fillColor: Colors.grey[200],
                        prefixIcon: Icon(Icons.phone),
                        hintText: 'Enter Phone Number',
                        hintStyle: GoogleFonts.roboto(fontSize: 16),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter phone number';
                        } else if (!isValidPhoneNumber(value)) {
                          return 'Please enter a 9 digit number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _phoneNumber = value ?? '';
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
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
                            if (_formKey.currentState?.validate() ?? false) {
                              _formKey.currentState?.save();
                              print('Resetting password for $_phoneNumber');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpAuthenticationPage(
                                    phoneNumber: _phoneNumberController.text,
                                  ),
                                ),
                              );
                            }
                          },
                          splashColor: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'SEND OTP',
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
      'Reset Password',
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
