import 'package:appointmentbooking/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appointmentbooking/core/constants/color_constants.dart';
import 'package:appointmentbooking/core/di/injection_getit.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // Init Dependency Inject
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(360, 640), minTextAdapt: true, splitScreenMode: true);
    return MaterialApp.router(
      title: 'Appointment booking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryBlue),
        useMaterial3: true,
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.notoSans().fontFamily,
        textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 30.sp)),
      ),
      routerConfig: router,
    );
  }
}
