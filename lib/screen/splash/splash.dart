import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayaku_app/config/textstyle/textstyles.dart';
import '../../config/config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          logo,
          height: 150.sp,
          width: 150.sp,
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70.h,
        child: Center(
          child: title16(
            'Powered by Falconet',
            context,
          ),
        ),
      ),
    );
  }
}
