import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/dashboard_screen/screens/dashboard.dart';
import 'package:share_plus/share_plus.dart';

class RadiologyDownloadReport extends StatefulWidget {
  const RadiologyDownloadReport({super.key});
  @override
  State<RadiologyDownloadReport> createState() =>
      _RadiologyDownloadReportState();
}

class _RadiologyDownloadReportState extends State<RadiologyDownloadReport>
    with SingleTickerProviderStateMixin {
  File? selectedFile;
  String _currentAppBarTitle = ScreenTitle.kDownloadPage;
  List<String> imageNames = [];
  List<String> imagePaths = [];
  String pathPDF = "";
  String text = '';
  String subject = '';
  String uri = '';
  final String selectedFileUrl = 'https://example.com/yourfile.pdf';

  late AnimationController _controller;
  late Animation<double> _animation;

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
                          height: 5,
                        ),
                        _downloadContainer(),
                        _imageContaienr(),
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

  Widget _downloadContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.grey)),
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/pdf.svg'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Knee Surgery')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xFF0B7F8C),
                      foregroundColor: Colors.white,
                      textStyle: GoogleFonts.cairo(fontSize: 14),
                    ),
                    onPressed: () {},
                    child: Text('Download'),
                    // other arguments
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'Oral surgery is broad term for any operation performed\n on your teeth, gums, jaw, or surrounding oral and facial\n structures. it includes a wide range of procedure\n, including teeth extractions, dental bone grafts,\n pariodontal (gum) grafts and currective jaw surgery.\n '
                ' \n  '
                '\n'
                'There are several types of oral surgery procedures\nPerformed each year. Some of the most common include, \n tooth extraction dental bone grafts, dental implants',
                style: GoogleFonts.roboto(color: Colors.grey),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget _imageContaienr() {
  return Container(
    child: SvgPicture.asset('assets/images/Mask Group 206.svg'),
  );
}
