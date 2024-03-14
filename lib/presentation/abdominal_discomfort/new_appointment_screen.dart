import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:patient_app/controllers/list_controller.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/screen_title.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/abdominal_discomfort/abdominal_discomfort.dart';
import 'package:patient_app/presentation/abdominal_discomfort/appointment.dart';
import 'package:patient_app/presentation/request_screen/apointment.dart';
import 'package:shimmer/shimmer.dart';

class NewAppointmentPage extends StatefulWidget {
  NewAppointmentPage({Key? key}) : super(key: key);
  @override
  _NewAppointmentPageState createState() => _NewAppointmentPageState();
}

class _NewAppointmentPageState extends State<NewAppointmentPage> {
  var controller = Get.put(ListController());
  TextEditingController _searchController = TextEditingController();
  List<String> filteredLabels = [];
  List<String> imagePaths = [
    'assets/images/dentist.png',
    'assets/images/cardiology.png',
    'assets/images/physician.png',
    'assets/images/pediatric.png',
    'assets/images/neurologist.png',
  ];
  List<String> labels = [
    'Dentist',
    'Cardiology',
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
  void initState() {
    controller.getUsers();
    print("++++${controller.departmentdata.value}");
    super.initState();
  }

  void _search() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredLabels =
          labels.where((label) => label.toLowerCase().contains(query)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.primarydarkGreenColor,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              alignment: Alignment(1.0, -1.0),
              image: AssetImage(ImageSaource.kString1),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: _buildLoadedBody(),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ScreenTitle.knewAppointmentScreen,
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
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageSaource.kloginLogo),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ],
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }

  Widget _buildLoadingBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.white,
            size: 200,
          ),
          _buildAppBar(),
          const SizedBox(height: 20),
          _buildSearchField(),
          const SizedBox(height: 20),
          Expanded(child: _buildCategoryList()),
        ],
      ),
    );
  }

  Widget _buildLoadedBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointementPage(),
                      ),
                    );
                  },
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ScreenTitle.knewAppointmentScreen,
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
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImageSaource.kloginLogo),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildSearchField(),
            const SizedBox(height: 16),
            _buildCategoryList(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Center(
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          height: 55,
          width: MediaQuery.of(context).size.width / 1.1,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 3,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            border: Border.all(
                color: const Color.fromARGB(255, 130, 130, 130), width: 1),
          ),
          child: Center(
            child: TextFormField(
              controller: _searchController,
              onChanged: (value) => _search(),
              decoration: InputDecoration(
                hintText: ScreenTitle.ksearch,
                hintStyle: GoogleFonts.cairo(
                  fontSize: 16,
                  color: Color.fromARGB(255, 64, 64, 64),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 28,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        controller.isLoading.value = false;
      });
    });

    return Container(
      height: MediaQuery.of(context).size.height * 0.8, // Adjust the height as needed
      child: controller.isLoading.value
          ? Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey,
        child: Container(
          child: Obx(
                () => ListView.separated(
              physics: NeverScrollableScrollPhysics(), // Disable scrolling when shimmering
              shrinkWrap: true,
              itemCount: controller.departmentdata.value,
              separatorBuilder: (BuildContext context, int index) => Divider(
                indent: 110,
                thickness: 2,
              ),
              itemBuilder: (context, index) {
                // final imagePaths = controller.newimages[index]?.image;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AbdominalDiscomfortPage(),
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
                        _buildCategoryImage(index),
                        SizedBox(width: 8),
                        _buildCategoryDetails(index),
                        Spacer(),
                        _buildArrowIcon(),
                      ],

                    ),
                  ),

                );
              },
            ),
          ),
        ),
      )
          : Obx(
            () => ListView.separated(
          shrinkWrap: true,
          itemCount: controller.departmentdata.value,
          separatorBuilder: (BuildContext context, int index) => Divider(
            indent: 110,
            thickness: 2,
          ),
          itemBuilder: (context, index) {
            // final imagePaths = controller.newimages[index]?.image;

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AbdominalDiscomfortPage(),
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
                    _buildCategoryImage(index),
                    SizedBox(width: 8),
                    _buildCategoryDetails(index),
                    Spacer(),
                    _buildArrowIcon(),
                  ],
                ),
              ),

            );
          },
        ),
      ),
    );
  }



  Widget _buildCategoryImage(int index) {
    final imageUrl = controller.departmentModel!.data![index].image ?? '';
    return Container(
      height: 95,
      width: 95,
      decoration: BoxDecoration(
        color: Color(0xFFF6F7FA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFF006064), width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: imageUrl.isNotEmpty
              ? Image.network(
                  imageUrl,
                  height: 65,
                  width: 85,
                  fit: BoxFit.contain,
                )
              : Placeholder(),
        ),
      ),
    );
  }

  Widget _buildCategoryDetails(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [ Text(
            "${controller.departmentModel!.data![index].descriptionEng}",
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: ColorManager.primarydarkGreenColor,
            ),
            overflow: TextOverflow.visible,
          ),
              ],
        ),
        Text(
          "${controller.departmentModel!.data![index].doctorCount}",
          style: GoogleFonts.roboto(
            fontSize: 14,
          ),
        ),
      ],
    );
  }




  Widget _buildArrowIcon() {
    return Icon(
      Icons.arrow_forward_ios,
      color: Colors.grey,
      size: 20,
    );
  }
}
