import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/meal/meal_list.dart';

class Meal extends StatefulWidget {
  const Meal({super.key});
  @override
  State<Meal> createState() => _MealState();
}

Widget _centerImage() {
  return Container(
    height: 300,
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      child: SvgPicture.asset(
        "assets/images/meal_dashboard.svg",
      ),
    ),
  );
}

class _MealState extends State<Meal> {
  String _currentAppBarTitle = ScreenTitle.kMeal;
  List<String> imagePaths = [
    'assets/images/breakfast.svg',
    'assets/images/meal.svg',
    'assets/images/fruites.svg',
    'assets/images/break_fast.svg',
  ];

  List<String> labels = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Fruits',
  ];

  
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
          body: Column(
            children: [
              _buildAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _centerImage(),
                      SizedBox(
                        height: 10,
                      ),
                      _centerText(),
                      SizedBox(
                        height: 10,
                      ),
                      _buildServicesGrid(),
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

  Widget _centerText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Choose Your Meal Type',
          style: GoogleFonts.cairo(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        )
      ],
    );
  }

  Widget _buildServicesGrid() {
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              if (index < labels.length) {
                return _buildServiceItem(imagePaths[index], labels[index]);
              } else {
                return SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildServiceItem(String imagePath, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) =>
                FadeTransition(opacity: animation, child: MealList()),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFFF6F7FA),
              border: Border.all(
                color: Color(0xFF848484),
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imagePath,
                height: 50,
                width: 50,
              ),
              SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
