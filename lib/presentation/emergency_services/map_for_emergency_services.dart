import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_ripple_animation/ripple_animation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geocoding/geocoding.dart';
import 'package:patient_app/controllers/place_controller.dart';
import 'package:patient_app/data/sky_strings.dart/colors_manager.dart';
import 'package:patient_app/data/sky_strings.dart/hint_strings.dart';
import 'package:patient_app/data/sky_strings.dart/sky_img_source.dart';
import 'package:patient_app/presentation/dashboard_screen/screens/dashboard.dart';

class EmergencyServicesTracker extends StatefulWidget {
  const EmergencyServicesTracker({Key? key}) : super(key: key);

  @override
  State<EmergencyServicesTracker> createState() =>
      EmergencyServicesTrackerState();
}

class EmergencyServicesTrackerState extends State<EmergencyServicesTracker> {

  final PlaceController searchController = Get.put(PlaceController());
  

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  LatLng sourceLocation = LatLng(37.42796133580664, -122.085749655962);
  LatLng destination = LatLng(37.42796133580664, -122.085749655962);
  List<LatLng> polyCordinates = [];
  Polyline _polyline = Polyline(
    polylineId: PolylineId('ambulanceRoute'),
    color: Colors.blue,
    width: 5,
  );

  Route _createRoute({required Widget destination}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              HintString.kYourAppointment,
              style: GoogleFonts.cairo(
                color: ColorManager.primarydarkGreenColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(
              context,
              _createRoute(
                destination: DashBoardScreen(),
              ),
            );
          },
          child: Container(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.grey,
              )),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                ImageSaource.kloginLogo,
                height: 50,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            myLocationEnabled: false,
            compassEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: {
              Marker(
                markerId: MarkerId("Source"),
                position: sourceLocation,
                infoWindow: InfoWindow(
                  title: "Source",
                  snippet: "This is the source location",
                ),
                icon: BitmapDescriptor.defaultMarker,
              ),
              Marker(
                markerId: MarkerId("Destination"),
                position: destination,
                infoWindow: InfoWindow(
                  title: "Destination",
                  snippet: "This is the destination location",
                ),
                icon: BitmapDescriptor.defaultMarker,
              ),
            },
            polylines: Set<Polyline>.of([_polyline]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 100),
            child: Container(
              height: 90,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: searchController.search_Controller,
                      onChanged: (value) {},
                      decoration: InputDecoration(labelText: 'Find me'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: MediaQuery.of(context).size.width / 2 - 100.0,
            child: RipplesAnimation(
              size: 50,
              reverse: false,
              color: Colors.red,
              child: GestureDetector(
                onTap: () {
                  _goToTheLake();
                },
                child: Container(
                  height: 80,
                  width: 80,
                  child: Center(
                    child: Text(
                      'SOS',
                      style: GoogleFonts.cairo(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   foregroundColor: ColorManager.primarydarkGreenColor,
      //   backgroundColor: ColorManager.primarydarkGreenColor,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(28),
      //   ),
      //   child: Icon(
      //     Icons.gps_fixed_outlined,
      //     color: Colors.white,
      //   ),
      //   onPressed: () {
      //     showModalBottomSheet<void>(
      //       context: context,
      //       builder: (BuildContext context) {
      //         return SizedBox(
      //           child: Container(
      //             decoration: BoxDecoration(
      //               color: Colors.white,
      //               borderRadius: BorderRadius.only(
      //                 topLeft: Radius.circular(20),
      //                 topRight: Radius.circular(20),
      //               ),
      //             ),
      //             height: double.infinity,
      //             width: double.infinity,
      //             child: Column(
      //               children: [
      //                 Container(
      //                   padding: const EdgeInsets.all(20),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       Text(
      //                         'Add Pickup Details',
      //                         style: GoogleFonts.cairo(
      //                           fontSize: 18,
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Expanded(
      //                   child: Container(
      //                     padding: const EdgeInsets.all(20),
      //                     child: Column(
      //                       children: [
      //                         SizedBox(
      //                           height: 55,
      //                           child: TextFormField(
      //                             decoration: InputDecoration(
      //                               labelText: 'Name',
      //                               filled: true,
      //                               fillColor:
      //                                   Color.fromARGB(255, 237, 237, 237),
      //                               labelStyle: GoogleFonts.cairo(
      //                                 color: Colors.black,
      //                                 fontSize: 16,
      //                               ),
      //                               enabledBorder: OutlineInputBorder(
      //                                 borderRadius: BorderRadius.circular(10.0),
      //                                 borderSide: BorderSide(
      //                                   color: Colors.grey,
      //                                 ),
      //                               ),
      //                               focusedBorder: OutlineInputBorder(
      //                                 borderRadius: BorderRadius.circular(10.0),
      //                                 borderSide: BorderSide(
      //                                   color:
      //                                       ColorManager.primarydarkGreenColor,
      //                                 ),
      //                               ),
      //                               // prefixText: prefixText,
      //                               prefixStyle: GoogleFonts.cairo(
      //                                 color: Colors.black,
      //                                 fontSize: 16,
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         const SizedBox(height: 10),
      //                         SizedBox(
      //                           height: 55,
      //                           child: TextFormField(
      //                             decoration: InputDecoration(
      //                               labelText: 'Phone',
      //                               filled: true,
      //                               fillColor:
      //                                   Color.fromARGB(255, 237, 237, 237),
      //                               labelStyle: GoogleFonts.cairo(
      //                                 color: Colors.black,
      //                                 fontSize: 16,
      //                               ),
      //                               enabledBorder: OutlineInputBorder(
      //                                 borderRadius: BorderRadius.circular(10.0),
      //                                 borderSide: BorderSide(
      //                                   color: Colors.grey,
      //                                 ),
      //                               ),
      //                               focusedBorder: OutlineInputBorder(
      //                                 borderRadius: BorderRadius.circular(10.0),
      //                                 borderSide: BorderSide(
      //                                   color:
      //                                       ColorManager.primarydarkGreenColor,
      //                                 ),
      //                               ),
      //                               prefixText: '+966',
      //                               prefixStyle: GoogleFonts.cairo(
      //                                 color: Colors.black,
      //                                 fontSize: 16,
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         const SizedBox(height: 10),
      //                         SizedBox(
      //                           height: 55,
      //                           child: TextFormField(
      //                             decoration: InputDecoration(
      //                               labelText: 'Flat/Door No',
      //                               filled: true,
      //                               fillColor:
      //                                   Color.fromARGB(255, 237, 237, 237),
      //                               labelStyle: GoogleFonts.cairo(
      //                                 color: Colors.black,
      //                                 fontSize: 16,
      //                               ),
      //                               enabledBorder: OutlineInputBorder(
      //                                 borderRadius: BorderRadius.circular(10.0),
      //                                 borderSide: BorderSide(
      //                                   color: Colors.grey,
      //                                 ),
      //                               ),
      //                               focusedBorder: OutlineInputBorder(
      //                                 borderRadius: BorderRadius.circular(10.0),
      //                                 borderSide: BorderSide(
      //                                   color:
      //                                       ColorManager.primarydarkGreenColor,
      //                                 ),
      //                               ),
      //                               // prefixText: prefixText,
      //                               prefixStyle: GoogleFonts.cairo(
      //                                 color: Colors.black,
      //                                 fontSize: 16,
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         const SizedBox(height: 10),
      //                         SizedBox(
      //                           height: 55,
      //                           child: TextFormField(
      //                             decoration: InputDecoration(
      //                               labelText: 'Address',
      //                               filled: true,
      //                               fillColor:
      //                                   Color.fromARGB(255, 237, 237, 237),
      //                               labelStyle: GoogleFonts.cairo(
      //                                 color: Colors.black,
      //                                 fontSize: 16,
      //                               ),
      //                               enabledBorder: OutlineInputBorder(
      //                                 borderRadius: BorderRadius.circular(10.0),
      //                                 borderSide: BorderSide(
      //                                   color: Colors.grey,
      //                                 ),
      //                               ),
      //                               focusedBorder: OutlineInputBorder(
      //                                 borderRadius: BorderRadius.circular(10.0),
      //                                 borderSide: BorderSide(
      //                                   color:
      //                                       ColorManager.primarydarkGreenColor,
      //                                 ),
      //                               ),
      //                               suffixIcon: Icon(
      //                                 Icons.gps_fixed_outlined,
      //                                 color: ColorManager.primarydarkGreenColor,
      //                               ),
      //                               // prefixText: prefixText,
      //                               prefixStyle: GoogleFonts.cairo(
      //                                 color: Colors.black,
      //                                 fontSize: 16,
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         const SizedBox(height: 20),
      //                         Container(
      //                           width: double.infinity,
      //                           height: 70,
      //                           decoration: BoxDecoration(
      //                             borderRadius: BorderRadius.circular(40),
      //                             gradient: LinearGradient(
      //                               colors: [
      //                                 Color(0xFF0B7F8C),
      //                                 ColorManager.primarydarkGreenColor,
      //                               ],
      //                               begin: Alignment.topLeft,
      //                               end: Alignment.bottomRight,
      //                             ),
      //                             boxShadow: [
      //                               BoxShadow(
      //                                 color: Colors.grey,
      //                                 offset: const Offset(
      //                                   4.0,
      //                                   4.0,
      //                                 ),
      //                                 blurRadius: 5.0,
      //                                 spreadRadius: 2.0,
      //                               ), //BoxShadow
      //                               BoxShadow(
      //                                 color: Colors.grey,
      //                                 offset: const Offset(0.0, 0.0),
      //                                 blurRadius: 0.0,
      //                                 spreadRadius: 0.0,
      //                               ), //BoxShadow
      //                             ],
      //                           ),
      //                           child: Center(
      //                             child: Text(
      //                               'Save & Proceed',
      //                               style: GoogleFonts.cairo(
      //                                   fontSize: 17,
      //                                   color: Colors.white,
      //                                   fontWeight: FontWeight.w600),
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;

    LatLng? pickupLocation = await getCoordinatesFromAddress('Pickup Address');
    LatLng? destinationLocation =
        await getCoordinatesFromAddress('Destination Address');

    if (pickupLocation != null && destinationLocation != null) {
      List<LatLng> polylineCoordinates = [
        pickupLocation,
        destinationLocation,
      ];

      setState(() {
        polyCordinates = polylineCoordinates;
        _polyline = _polyline.copyWith(pointsParam: polylineCoordinates);
      });

      double minLat = polylineCoordinates.first.latitude;
      double minLng = polylineCoordinates.first.longitude;
      double maxLat = polylineCoordinates.first.latitude;
      double maxLng = polylineCoordinates.first.longitude;
      for (LatLng point in polylineCoordinates) {
        minLat = math.min(minLat, point.latitude);
        minLng = math.min(minLng, point.longitude);
        maxLat = math.max(maxLat, point.latitude);
        maxLng = math.max(maxLng, point.longitude);
      }

      LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(minLat, minLng),
        northeast: LatLng(maxLat, maxLng),
      );

      controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    } else {
      print('Error getting coordinates');
    }
  }

  Future<LatLng?> getCoordinatesFromAddress(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        return LatLng(locations.first.latitude, locations.first.longitude);
      }
    } catch (e) {
      print("Error: $e");
    }
    return null;
  }
}
