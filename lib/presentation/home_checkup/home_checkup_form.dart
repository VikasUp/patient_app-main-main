import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/presentation/home_checkup/home_checkup.dart';
import 'package:patient_app/presentation/otp_screen/otp_page.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});
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
        color: Colors.white,
        image: DecorationImage(
          alignment: Alignment(1.0, -1.0),
          image: AssetImage('assets/images/noti_background.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 110,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Image.asset(
                  'assets/images/leading_action_button.png',
                  height: 40,
                  width: 40,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeCheckUpPage(),
                    ),
                  );
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Book New Visit",
                    style: GoogleFonts.cairo(
                      color: Color(0xFF006064),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Image.asset(
                  'assets/images/login_logo.png',
                  height: 50,
                  width: 50,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Book A Home Visit',
                    style: GoogleFonts.roboto(
                        fontSize: 29, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Now!',
                    style: GoogleFonts.roboto(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 127, 131),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 54,
                          width: size.width * 0.9,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              filled: true,
                              fillColor: Color.fromARGB(255, 237, 237, 237),
                              labelStyle: GoogleFonts.cairo(
                                  color: Colors.black, fontSize: 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 176, 175, 175),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 176, 175, 175)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 54,
                          width: size.width * 0.9,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email ID',
                              filled: true,
                              fillColor: Color.fromARGB(255, 237, 237, 237),
                              labelStyle: GoogleFonts.cairo(
                                  color: Colors.black, fontSize: 16),
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
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 54,
                          width: size.width * 0.9,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: '+966-',
                              filled: true,
                              fillColor: Color.fromARGB(255, 237, 237, 237),
                              labelStyle: GoogleFonts.cairo(
                                  color: Colors.black, fontSize: 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 176, 175, 175),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 242, 240, 240)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your number';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 54,
                          width: size.width * 0.9,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Select Checkup Type',
                              filled: true,
                              fillColor: Color.fromARGB(255, 237, 237, 237),
                              labelStyle: GoogleFonts.cairo(
                                  color: Colors.black, fontSize: 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 176, 175, 175),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your checkup type';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 54,
                          width: size.width * 0.9,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Address',
                              filled: true,
                              fillColor: Color.fromARGB(255, 237, 237, 237),
                              labelStyle: GoogleFonts.cairo(
                                  color: Colors.black, fontSize: 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 176, 175, 175),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 176, 175, 175),
                                    width: 0.5),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your address';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 54,
                          width: size.width * 0.9,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Area Code',
                              filled: true,
                              fillColor: Color.fromARGB(255, 237, 237, 237),
                              labelStyle: GoogleFonts.cairo(
                                  color: Colors.black, fontSize: 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 176, 175, 175),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your area code ';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
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
                                    'nurse',
                                    'assets/images/nurse.png',
                                  ),
                                  const SizedBox(width: 30),
                                  buildEmploymentTypeRadioButton(
                                    'doctor',
                                    'assets/images/doctor.png',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Material(
                              child: Checkbox(
                                side: BorderSide(
                                    color: Color(0xFF006064), width: 1.5),
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
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
                                  if (_formKey.currentState?.validate() ??
                                      false) {}
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Container(
                                          height: 300,
                                          width: 350,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/dialogue_box.png',
                                                height: 200,
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'We Have Received Your Details.Our Customer Care Team Will Get Back To You Shortly',
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 14,
                                                        color: Colors.black),
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
                                                Navigator.pop(context);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        OtpPage(),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(23),
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
            decoration: BoxDecoration(
              color: Color(0xFFF6F7FA),
              border: Border.all(color: Colors.grey, width: 0.8),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Radio(
                    activeColor: Color.fromARGB(255, 0, 127, 131),
                    value: label,
                    groupValue: _selectedEmployment,
                    onChanged: (value) {
                      setState(() {
                        _selectedEmployment = value.toString();
                      });
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Image.asset(
                  image,
                  width: 90,
                  height: 62,
                ),
                const SizedBox(height: 5),
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
}
