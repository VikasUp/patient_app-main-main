import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/dashboard_screen/screens/dashboard.dart';
import 'package:patient_app/presentation/radiology_report/radiology_download_report.dart';
import 'package:share_plus/share_plus.dart';

class RadiologyReport extends StatefulWidget {
  const RadiologyReport({super.key});
  @override
  State<RadiologyReport> createState() => _RadiologyReportState();
}

class _RadiologyReportState extends State<RadiologyReport> {
  File? selectedFile;
  String _currentAppBarTitle = ScreenTitle.kDownloadPage;
  List<String> imageNames = [];
  List<String> imagePaths = [];
  String pathPDF = "";
  String text = '';
  String subject = '';
  String uri = '';
  final String selectedFileUrl = 'https://example.com/yourfile.pdf';

  @override
  void initState() {
    super.initState();
    _currentAppBarTitle = ScreenTitle.kDownloadPage;
  }

  void _onDeleteImage(int position) {
    setState(() {
      imagePaths.removeAt(position);
      imageNames.removeAt(position);
    });
  }

  void handleShare() {
    if (selectedFile != null) {
      Share.shareFiles([selectedFile!.path]);
    } else {
      print('No file selected to share');
    }
  }

  void handleOpenFile() async {
    if (selectedFile != null) {
      try {
        await OpenFile.open(selectedFile!.path);
      } catch (e) {
        print('Error opening file: $e');
      }
    } else {
      print('No file selected to open');
    }
  }

  SnackBar getResultSnackBar(ShareResult result) {
    return SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Share result: ${result.status}"),
          if (result.status == ShareResultStatus.success)
            Text("Shared to: ${result.raw}")
        ],
      ),
    );
  }

  shareFile(String path) async {
    await Share.shareFiles([path]);
  }

  Widget _centerImage() {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        child: SvgPicture.asset(
          "assets/images/radio_dashboard.svg",
        ),
      ),
    );
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
          body: Container(
            child: Column(
              children: [
                _buildAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        _centerImage(),
                        SizedBox(
                          height: 10,
                        ),
                        _centerText(),
                        SizedBox(
                          height: 10,
                        ),
                        _textFormFields(),
                      ],
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
                builder: (context) => DashBoardScreen(),
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

  Widget _centerText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Download All Your Reports here',
          style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget _textFormFields() {
    Color myColor = Color(0xFFF5F5F5);

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 61,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Patient Name',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                filled: true,
                fillColor: myColor,
                labelStyle: GoogleFonts.cairo(
                  color: Colors.black,
                  fontSize: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    color: ColorManager.primarydarkGreenColor,
                  ),
                ),
                // prefixText: prefixText,
                prefixStyle: GoogleFonts.cairo(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 62,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Date Of Birth',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                filled: true,
                fillColor: myColor,
                labelStyle: GoogleFonts.cairo(
                  color: Colors.black,
                  fontSize: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    color: ColorManager.primarydarkGreenColor,
                  ),
                ),
                // prefixText: prefixText,
                prefixStyle: GoogleFonts.cairo(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 62,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                filled: true,
                fillColor: myColor,
                labelStyle: GoogleFonts.cairo(
                  color: Colors.black,
                  fontSize: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    color: ColorManager.primarydarkGreenColor,
                  ),
                ),
                prefixText: '+966',
                prefixStyle: GoogleFonts.cairo(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Your Report ID',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                filled: true,
                fillColor: myColor,
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
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    color: ColorManager.primarydarkGreenColor,
                  ),
                ),
                prefixStyle: GoogleFonts.cairo(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
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
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 15,
                                    ),
                                    _getImageForFile(selectedFile),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(Icons.close))
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  selectedFile?.path ?? '',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            handleOpenFile();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                color: ColorManager
                                                    .primarydarkGreenColor,
                                                width: 1.5,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 30,
                                                vertical: 10,
                                              ),
                                              child: Text(
                                                'OPEN',
                                                style: GoogleFonts.cairo(
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorManager
                                                      .primarydarkGreenColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            handleShare();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                width: 1.5,
                                                color: ColorManager
                                                    .primarydarkGreenColor,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30, vertical: 10),
                                              child: Text(
                                                'SHARE',
                                                style: GoogleFonts.cairo(
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorManager
                                                      .primarydarkGreenColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RadiologyDownloadReport()));
                                      },
                                      splashColor:
                                          Colors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(40),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 17),
                                        child: Text(
                                          'Download',
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
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  splashColor: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Get Your Report',
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
        ],
      ),
    );
  }

  Widget _getImageForFile(File? file) {
    if (file == null) {
      return SvgPicture.asset(
        'assets/images/pdf.svg',
        height: 80,
        width: 90,
      );
    }
    String extension = file.path.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return SvgPicture.asset(
          'assets/images/pdf.svg',
          height: 55,
          width: 55,
        );
      default:
        return SvgPicture.asset(
          'assets/images/pdf.svg',
          height: 55,
          width: 55,
        );
    }
  }
}
