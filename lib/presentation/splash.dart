import 'dart:async';
import 'package:flutter/material.dart';
import 'package:patient_app/presentation/on_bording_screens.dart';

class SplashScreen extends StatefulWidget {
  static String tag = 'splash-screen';
  final String backgroundImagePath;
  final String centerImagePath;
  const SplashScreen({
    Key? key,
    required this.backgroundImagePath,
    required this.centerImagePath,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => OnBoardingScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              widget.backgroundImagePath,
              fit: BoxFit.cover,
            ),
            Center(
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  width: 300,
                  height: 300,
                  child: Image.asset(
                    widget.centerImagePath,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
