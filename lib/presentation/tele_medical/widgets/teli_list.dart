import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/data/sky_strings.dart/hint_strings.dart';
import 'package:patient_app/presentation/abdominal_discomfort/abdominal_discomfort.dart';
import 'package:patient_app/presentation/tele_medical/tele_medical.dart';
import 'package:patient_app/presentation/tele_medical/widgets/doctors_list_card.dart';

class TeleMedicalList extends StatefulWidget {
  TeleMedicalList({Key? key}) : super(key: key);

  @override
  _TeleMedicalListState createState() => _TeleMedicalListState();
}

class _TeleMedicalListState extends State<TeleMedicalList> {
  List<String> imagePaths = [
    'assets/images/dentist.png',
    'assets/images/cardiology.png',
    'assets/images/physician.png',
    'assets/images/pediatric.png',
    'assets/images/neurologist.png',
  ];

  List<String> labels = [
    'Dentist',
    'Cradiology',
    'Physician',
    'Pediatric',
    'Neurologist',
  ];
  List<String> subTitle = [
    '08 Doctor',
    '09 Doctor',
    '07 Doctor',
    '06 Doctor',
    '05 Doctor',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          alignment: Alignment(1.0, -1.0),
          image: AssetImage('assets/images/noti_background.png'),
        ),
      ),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 110,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                IconButton(
                  icon: Image.asset(
                    'assets/images/leading_action_button.png',
                    height: 40,
                    width: 40,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeleMedicalPage(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create New Appointment",
                        style: GoogleFonts.cairo(
                          color: Color(0xFF006064),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 150,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 115,
                      child: IconButton(
                        icon: Image.asset(
                          'assets/images/floating_action_button.png',
                          height: 50,
                          width: 50,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorsListPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width / 1.1,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: Colors.black, width: 0.8),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search here by symptom',
                          hintStyle: GoogleFonts.cairo(
                            fontSize: 18,
                          ),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        HintString.kChooseCategory,
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Expanded(
                    child: ListView.separated(
                      itemCount: imagePaths.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorsListPage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 95,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF6F7FA),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Color(0xFF006064), width: 1),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Image.asset(
                                        imagePaths[index],
                                        height: 50,
                                        width: 44.56,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      labels[index],
                                      style: GoogleFonts.cairo(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color(0xFF006064)),
                                    ),
                                    Text(
                                      subTitle[index],
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
