import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';

class DetailAnnouncement extends StatefulWidget {
  const DetailAnnouncement({super.key});
  @override
  State<DetailAnnouncement> createState() => _DetailAnnouncementState();
}

class _DetailAnnouncementState extends State<DetailAnnouncement> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                _buildStartText(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        _buildContentWidget()
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
        height: MediaQuery.of(context).copyWith().size.height / 20,
        width: MediaQuery.of(context).copyWith().size.height / 20,
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
      'Announcements',
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

  Widget _buildStartText() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Text(
            'Whats Personality Got To do with us? A Lot',
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w900, fontSize: 15),
          ),
        ),
      ],
    );
  }

  Widget _buildContentWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SvgPicture.asset('assets/images/Group 66715.svg'),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'By Richard Kensinger',
                      style:
                          GoogleFonts.cairo(color: Colors.grey, fontSize: 15),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Text('27.01.2021',
                        style: GoogleFonts.cairo(
                            color: Colors.grey, fontSize: 15)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
