import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/authentication_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 115),
                Container(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/login_logo.png',
                          width: 70,
                          height: 70,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Welcome',
                          style: GoogleFonts.cairo(
                            color: Color(0xFF006064),
                            fontWeight: FontWeight.w900,
                            fontSize: 35,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Sign in via Email',
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                      fillColor: Colors.grey[200],
                      hintText: 'Email Address',
                      hintStyle: GoogleFonts.roboto(
                        fontSize: 16,
                      ),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19, vertical: 10),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                      fillColor: Colors.grey[200],
                      hintText: 'Password',
                      hintStyle: GoogleFonts.roboto(fontSize: 16),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      filled: true,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Remember Me clicked");
                        setState(() {
                          rowColor = Colors.green;
                        });
                      },
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("Checkbox clicked");
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
                            'Remember Me',
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text('Forgot Password ?',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19, vertical: 10),
                  child: ElevatedButton(
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
                          borderRadius: BorderRadius.circular(8)),
                      primary: Color(0xFF006064),
                    ),
                    child: Container(
                      height: 60,
                      child: Center(
                        child: Text(
                          "SIGN IN",
                          style: GoogleFonts.mukta(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "OR",
                    style: GoogleFonts.roboto(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: Text(
                    "Login via Social",
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      social('https://i.postimg.cc/HxFdTLVG/google-plus.png'),
                      social('https://i.postimg.cc/0y4tWK3q/facebook-2.png'),
                      social('https://i.postimg.cc/GpsXZhwT/twitter-3.png'),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                Container(
                  margin: EdgeInsets.only(bottom: 1),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget social(String url) {
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
