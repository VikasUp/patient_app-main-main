import 'package:flutter/material.dart';
import 'package:patient_app/presentation/abdominal_discomfort/abdominal_discomfort.dart';
import 'package:patient_app/presentation/abdominal_discomfort/appointment.dart';
import 'package:patient_app/presentation/abdominal_discomfort/date_list.dart';
import 'package:patient_app/presentation/abdominal_discomfort/new_appointment_screen.dart';
import 'package:patient_app/presentation/dashboard_screen/screens/dashboard.dart';
import 'package:patient_app/presentation/login_screen/otp_auth.dart';
import '../presentation/splash.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(
            backgroundImagePath: 'assets/images/background_image.png',
            centerImagePath: 'assets/images/splash_logo.png',
          ),
        );
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const DashBoardScreen(),
        );
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const AppointementPage(),
        );
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => NewAppointmentPage(),
        );
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => AbdominalDiscomfortPage(),
        );
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => DateList(),
        );
      case AppRoutes.otpAuthentication:
        return MaterialPageRoute(
          builder: (_) => OtpAuthenticationPage(phoneNumber: '',),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Unknown route: ${settings.name}'),
            ),
          ),
        );
    }
  }
}
