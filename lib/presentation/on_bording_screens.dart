import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/dashboard_screen/screens/dashboard.dart';
import 'package:patient_app/data/models/on_boarding_model.dart';

final List<OnBoard> demoData = [
  OnBoard(
    image: "assets/images/on_boarding_page1.png",
    logo: "assets/images/app_logo.png",
    title: "Find the best doctors\nin your vicinity",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  OnBoard(
    image: "assets/images/on_boarding_page2.png",
    logo: "assets/images/app_logo.png",
    title: "Make a Schedule,\nEasily",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  OnBoard(
    image: "assets/images/on_boarding_page3.png",
    logo: "assets/images/app_logo.png",
    title: "Care And Cure,\nis Our Goal",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
];

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (currentIndex < demoData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashBoardScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashBoardScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 70,
                  width: 142,
                  child: Image.asset(
                    'assets/images/app_logo.png',
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: demoData.length,
                  controller: _pageController,
                  itemBuilder: (context, index) => OnBoardContent(
                    title: demoData[index].title,
                    description: demoData[index].description,
                    image: demoData[index].image,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Indicator(
                        length: demoData.length,
                        currentIndex: currentIndex,
                        direction: Axis.horizontal,
                        radius: 50.0,
                        animationDuration: 300,
                        activeColor: const Color(0xFF006064),
                        inactiveColor: const Color(0xFF006064),
                      ),
                      SizedBox(width: 16),
                      InkWell(
                        onTap: _nextPage,
                        child: Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                            color: const Color(0xFF006064),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Color(0xFFA5CDCE),
                              width: 5,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Next",
                              style: GoogleFonts.cairo(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                color: Color(0xFF006064),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.cairo(
              color: const Color.fromARGB(255, 120, 120, 120),
              fontSize: 13,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            image,
            height: 300,
            width: 200,
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(height: MediaQuery.of(context).size.height),
        ],
      );
    });
  }
}

class Indicator extends StatelessWidget {
  final int length;
  final int currentIndex;
  final Axis direction;
  final double radius;
  final double animationDuration;
  final Color activeColor;
  final Color inactiveColor;

  const Indicator({
    required this.length,
    required this.currentIndex,
    this.direction = Axis.horizontal,
    this.radius = 10.0,
    this.animationDuration = 300,
    this.activeColor = const Color(0xFF006064),
    this.inactiveColor = const Color(0xFFA5CDCE),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        length,
        (index) => buildDot(index, context),
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    bool isActive = currentIndex == index;

    ColorTween colorTween = ColorTween(
      begin: inactiveColor,
      end: inactiveColor.withOpacity(0.5),
    );

    return AnimatedContainer(
      duration: Duration(milliseconds: animationDuration.toInt()),
      height: 10,
      width: isActive ? 25 : 10,
      margin: EdgeInsets.symmetric(
        horizontal: 7,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: isActive
            ? activeColor
            : colorTween.transform((currentIndex - index).toDouble()),
      ),
      child: Opacity(
        opacity: isActive ? 1.0 : 0.5,
      ),
    );
  }
}
