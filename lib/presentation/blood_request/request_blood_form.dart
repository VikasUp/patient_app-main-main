import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/blood_request/blood_request.dart';

class RequestBloodForm extends StatefulWidget {
  const RequestBloodForm({Key? key}) : super(key: key);
  @override
  State<RequestBloodForm> createState() => _RequestBloodFormState();
}

class _RequestBloodFormState extends State<RequestBloodForm> {
  double _currentSliderValue = 0;
  String? value;
  String _currentAppBarTitle = ScreenTitle.kBloodRequest;
  @override
  void initState() {
    super.initState();
    _currentAppBarTitle = ScreenTitle.kBloodRequest;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: ColorManager.primarywhiteColor,
            image: DecorationImage(
              alignment: Alignment(1.0, -1.0),
              image: AssetImage(ImageSaource.kString1),
            ),
          ),
          child: Column(
            children: [
              _buildAppBar(),
              _buildBloodInfo(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildRaiseRequestFor(),
                      _buildPatientDetailsForm(),
                      _buildRequestForOptions(),
                      SizedBox(height: 10),
                      _buildNumberOfUnitsSlider(),
                      _buildSlider(),
                    ],
                  ),
                ),
              ),
              _buildSubmitButton(),
            ],
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
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: const Color.fromARGB(255, 231, 229, 229),
        ),
        child: IconButton(
          iconSize: 20,
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => BloodRequestDonorPage(),
              ),
            );
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
      _currentAppBarTitle,
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

  Widget _buildBloodInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 53),
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 248, 195, 195), Colors.white],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset('assets/images/blood-drop.png', height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'O+',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Text(
                    'Change',
                    style: GoogleFonts.cairo(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRaiseRequestFor() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Raise Request For',
                style: GoogleFonts.cairo(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
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
        height: 55,
        width: 150,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 238, 238),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                child: Container(
                  width: 30,
                  height: 30,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPatientDetailsForm() {
    return Column(
      children: [
        SizedBox(height: 20),
        _buildTextFormField('Patient Name'),
        SizedBox(height: 20),
        _buildTextFormField('Relation With Patient'),
        SizedBox(height: 20),
        _buildNumberTextFormField('Phone'),
        SizedBox(height: 20),
        _buildTextFormField('Email'),
        SizedBox(height: 20),
        _buildRequestForLabel(),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildTextFormField(String labelText, {String prefixText = ''}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 55,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: labelText,
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
        height: 55,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: hintText,
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
              'Request For',
              style:
                  GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestForOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        children: [
          _buildRadioButton('Blood'),
          SizedBox(
            width: 50,
          ),
          _buildRadioButton('Platelets'),
        ],
      ),
    );
  }

  Widget _buildNumberOfUnitsSlider() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'No of Unit : ${_currentSliderValue.toInt()}',
              style: GoogleFonts.cairo(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Maximum : 5',
                  style: GoogleFonts.cairo(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSlider() {
    return Container(
      child: Slider(
        activeColor: ColorManager.primarydarkGreenColor,
        value: _currentSliderValue,
        max: 5,
        divisions: 5,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value > 5 ? 5 : value;
          });
        },
      ),
    );
  }

  Widget _buildSubmitButton() {
    return GestureDetector(
      onTap: () {
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
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        height: 65,
        decoration: BoxDecoration(
          color: ColorManager.primarydarkGreenColor,
          borderRadius: BorderRadius.circular(50),
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
            ), //BoxShadow
            BoxShadow(
              color: Colors.grey,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: Center(
          child: Text(
            'Submit Request',
            style: GoogleFonts.cairo(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget buildAlertDialogContent() {
    return Container(
      height: 250,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/blood_request_submit.png',
            height: 150,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: Text(
                'We Have Received Your Blood Request. Our Team Will Get Back To You Shortly',
                style: GoogleFonts.roboto(),
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
          onPressed: () {},
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
}
