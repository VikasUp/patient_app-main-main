import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/dashboard_screen/screens/dashboard.dart';

class DownloadedReports extends StatefulWidget {
  const DownloadedReports({super.key});

  @override
  State<DownloadedReports> createState() => _DownloadedReportsState();
}

class _DownloadedReportsState extends State<DownloadedReports> {
  List<String> text = [
    'Teeth Surgery',
    'Tooth Decay',
    'Abscess',
    'Tooth Sensivity',
    'Tooth Sensivity',
    'Tooth Sensivity',
  ];

  List<String> imageList = [
    "assets/images/pdf.svg",
    "assets/images/jpg (1).svg",
    "assets/images/pdf.svg",
    "assets/images/jpg (1).svg",
    "assets/images/pdf.svg",
    "assets/images/pdf.svg",
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
          body: Container(
            child: Column(
              children: [
                _buildAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _searchBar(),
                        _buildList(),
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
      'Your Documents',
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

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border.all(color: ColorManager.primarydarkGreenColor, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    hintText: 'Search Documents/Manual',
                    hintStyle: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                        fontSize: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFECFDFF),
                  border: Border.all(color: Color(0xFFA7D6DB)),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SvgPicture.asset(imageList[index]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text[index],
                        style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
