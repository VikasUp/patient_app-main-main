import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularProgressIndicatorPage extends StatefulWidget {
  const CircularProgressIndicatorPage({Key? key}) : super(key: key);
  @override
  State<CircularProgressIndicatorPage> createState() =>
      _CircularProgressIndicatorPageState();
}

class _CircularProgressIndicatorPageState
    extends State<CircularProgressIndicatorPage> {
  double progressValue = 0;
  double counterValue = 0;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 50), (Timer t) {
      setState(() {
        counterValue += 1;
      });
      if (counterValue >= 100) {
        t.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: const Color.fromARGB(255, 231, 229, 229),
                              border: Border.all(color: Colors.grey, width: 1)),
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
                      ]),
                ),
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Blood Pressure',
                          style: GoogleFonts.cairo(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 102, 102, 102)),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 236, 236, 236),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(29),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/custom_curcullar_progress_indicator.png',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: 0,
                            child: CircularPercentIndicator(
                              animation: true,
                              animationDuration: 2600,
                              radius: 160.0,
                              lineWidth: 12.0,
                              percent: progressValue,
                              backgroundColor: Colors.grey,
                              progressColor: ColorManager.primarydarkGreenColor,
                              onAnimationEnd: () {
                                setState(() {
                                  progressValue = 1;
                                });
                              },
                            ),
                          ),
                          Positioned.fill(
                            child: Center(
                              child: Text(
                                '${counterValue.toInt()}%',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Column(children: [
                      Text(
                        'You are Doing Great !',
                        style: GoogleFonts.cairo(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
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
