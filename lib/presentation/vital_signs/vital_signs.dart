import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/hint_strings.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/dashboard_screen/screens/dashboard.dart';
import 'package:patient_app/presentation/vital_signs/progress_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VitalSigns extends StatefulWidget {
  const VitalSigns({Key? key}) : super(key: key);
  @override
  State<VitalSigns> createState() => _VitalSignsState();
}

class _VitalSignsState extends State<VitalSigns> {
  final List<ChartData> chartData = [
    ChartData('s', 24),
    ChartData('m', 24),
    ChartData('t', 34),
    ChartData('w', 25),
    ChartData('th', 33),
    ChartData('fr', 29),
    ChartData('sat', 38),
  ];

  List<String> entries = [
    'Blood Pressure (bpm)',
    'Blood Oxygen (spo2)',
    'Blood Pressure (bpm)',
    'Heart Rate (Pulse)',
    'Blood Pressure (bpm)',
    'Blood Oxygen (spo2)',
    'Blood Pressure (bpm)',
    'Heart Rate (Pulse)',
  ];

  bool startAnimation = true;
  late Size size;
  Color _generateRandomColor() {
    Random random = Random();
    int colorIndex = random.nextInt(5);
    switch (colorIndex) {
      case 0:
        return Color.fromRGBO(
          208,
          71,
          85,
          1.0,
        );
      case 1:
        return Color.fromRGBO(
          200,
          169,
          66,
          1.0,
        );
      case 2:
        return Color.fromRGBO(
          70,
          97,
          195,
          1.0,
        );
      case 3:
        return ColorManager.primarydarkGreenColor;
      case 4:
        return Colors.pink;
      case 5:
        return Colors.black;
      default:
        return Colors.black;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  Future<PaletteGenerator> generatePalette(String imagePath) async {
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      AssetImage(imagePath),
      size: Size(100, 100),
      region: Rect.fromCenter(
        center: Offset(50, 50),
        width: 100,
        height: 100,
      ),
    );
    return paletteGenerator;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

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
          body: Container(
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                                      builder: (context) => DashBoardScreen()));
                            },
                            icon: Container(
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.grey.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        ScreenTitle.kVitalSigns,
                        style: GoogleFonts.cairo(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primarydarkGreenColor,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          ImageSaource.kloginLogo,
                          height: 55,
                          width: 55,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: HintString.ksearch,
                              hintStyle: GoogleFonts.cairo(
                                fontSize: 16,
                                color: Color.fromARGB(255, 64, 64, 64),
                              ),
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 21, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Measurements",
                          style: GoogleFonts.cairo(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              child: Text(
                                "ALL Signs",
                                style: GoogleFonts.cairo(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF006064),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFF006064),
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.0),
                          ],
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        height: size.height * 0.6,
                        child: ListView.separated(
                          primary: false,
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                            horizontal: 9,
                          ),
                          itemCount: entries.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              transform: Matrix4.translationValues(
                                startAnimation ? 0 : size.width,
                                0,
                                0,
                              ),
                              child: _buildListItem(
                                index,
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: 20,
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
      ),
    );
  }

  Widget _buildListItem(
    int index,
  ) {
    Color splineChartColor = _generateRandomColor();
    Color barChartColor = _generateRandomColor();
    return AnimatedOpacity(
      duration: Duration(milliseconds: 200),
      opacity: startAnimation ? 1.0 : 0.0,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(
          startAnimation ? 0 : size.width,
          0,
          0,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CircularProgressIndicatorPage(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: ColorManager.primarydarkGreenColor,
                width: 0.6,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: const Offset(
                    4.0,
                    4.0,
                  ),
                  blurRadius: 6.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: ListTile(
              title: Column(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            entries[index],
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Last 4 hours ',
                              style: GoogleFonts.roboto(
                                  fontSize: 12, color: Colors.grey)),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(
                              '141/90',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: index % 2 == 0
                                    ? splineChartColor
                                    : barChartColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '7 min ago',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: index % 2 == 0
                                    ? splineChartColor
                                    : barChartColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: index % 2 == 0
                            ? _buildLineChart(
                                splineChartColor: splineChartColor)
                            : _buildBarChart(barChartColor: barChartColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLineChart({required Color splineChartColor}) {
    return Container(
      height: 140,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SfCartesianChart(
          enableAxisAnimation: true,
          borderColor: Colors.transparent,
          primaryXAxis: CategoryAxis(
            isVisible: true,
            labelStyle: GoogleFonts.roboto(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
          primaryYAxis: NumericAxis(
            borderWidth: 0,
            isVisible: false,
            majorGridLines: MajorGridLines(width: 0),
            minorGridLines: MinorGridLines(width: 0),
          ),
          series: <CartesianSeries>[
            SplineSeries<ChartData, String>(
              color: splineChartColor,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart({required Color barChartColor}) {
    return Container(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SfCartesianChart(
          plotAreaBackgroundColor: Colors.transparent,
          margin: EdgeInsets.symmetric(vertical: 20),
          borderColor: Colors.transparent,
          borderWidth: 2,
          plotAreaBorderWidth: 0,
          enableAxisAnimation: true,
          enableSideBySideSeriesPlacement: false,
          primaryXAxis: CategoryAxis(
            labelStyle: GoogleFonts.roboto(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
          primaryYAxis: CategoryAxis(
            isVisible: false,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
          series: <CartesianSeries>[
            ColumnSeries<ChartData, String>(
                borderRadius: BorderRadius.circular(20),
                dataSource: chartData,
                width: 0.3,
                color: Colors.black,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y),
            ColumnSeries<ChartData, String>(
                borderRadius: BorderRadius.circular(20),
                dataSource: chartData,
                width: 0.3,
                color: barChartColor,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y)
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
