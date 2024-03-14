import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/dashboard_screen/screens/dashboard.dart';
import 'package:patient_app/presentation/sickness_track/view_reminder_page.dart';

class SicknessTrackUserPage extends StatefulWidget {
  const SicknessTrackUserPage({super.key});
  @override
  State<SicknessTrackUserPage> createState() => _SicknessTrackUserPageState();
}

class _SicknessTrackUserPageState extends State<SicknessTrackUserPage> {
  late ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _getImage() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {});
    }
  }

  List<String> imagePath = [
    'assets/images/tablet.png',
    'assets/images/capsule.png',
    'assets/images/capsule2.png',
    'assets/images/sickness.png',
  ];

  List<String> entries = [
    'Paracetamol XI 2',
    'Dpp-4 Inhibitors',
    'Amrinone',
  ];

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
          body: Stack(
            children: [
              Column(
                children: [
                  _buildAppBar(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildProfileSection(),
                          SizedBox(
                            height: 20,
                          ),
                          _buildButton('Deseases Name', () {}),
                          SizedBox(height: 20),
                          _buildMedicineSection(),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: [
          Material(
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Sickness Track',
            style: GoogleFonts.cairo(
              color: Color(0xFF006064),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Spacer(),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageSaource.kloginLogo),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Column(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ClipOval(
              child: Image.network(
                "https://static.vecteezy.com/system/resources/previews/004/201/722/original/online-doctor-physician-professional-with-stethoscope-consultant-medical-protection-covid-19-flat-style-icon-free-vector.jpg",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Darrell Steward',
          style: GoogleFonts.cairo(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Age: 25',
          style: GoogleFonts.cairo(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildButton(String text, Function onPressed) {
    return Container(
      height: 48,
      width: 244,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: ColorManager.primarydarkGreenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed as void Function()?,
        child: Text(
          text,
          style: GoogleFonts.cairo(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildMedicineSection() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today Medicine',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewReminderPage(),
                          ),
                        );
                      },
                      child: Container(
                        child: Text(
                          "View Reminders",
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
                    ),
                    SizedBox(width: 8.0),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            _buildMedicineList(),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMedicineList() {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildMedicineCard(index);
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 10,
      ),
    );
  }

  Card _buildMedicineCard(int index) {
    return Card(
      color: Colors.white,
      elevation: 7,
      child: ListTile(
        title: _buildMedicineTitle(index),
        leading: _buildMedicineLeading(index),
        contentPadding: EdgeInsets.symmetric(
          vertical: 3.0,
          horizontal: 16.0,
        ),
      ),
    );
  }

  Widget _buildMedicineTitle(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              entries[index],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "500 mg",
                          style: GoogleFonts.cairo(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF006064),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            _buildMedicineActionButton('Today Medicine', Color(0xFFC2F9FF)),
            SizedBox(width: 10),
            _buildMedicineActionButton('View Reminders', Color(0xFFCDDDFF)),
          ],
        ),
      ],
    );
  }

  Widget _buildMedicineActionButton(String text, Color backgroundColor) {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.cairo(
            fontSize: 11,
            color: text == 'Today Medicine'
                ? ColorManager.primarydarkGreenColor
                : Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildMedicineLeading(int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          child: Image.asset(
            imagePath[index % imagePath.length],
            width: 50,
            height: 50,
          ),
        ),
        Text('1Pills'),
        SizedBox(width: 20),
        VerticalDivider(
          width: 5,
          thickness: 1,
          color: Colors.black,
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
