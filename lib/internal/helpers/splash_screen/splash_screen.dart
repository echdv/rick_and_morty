import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/internal/helpers/bottom_navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const BottomNavBar()),
          (Route<dynamic> route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.primarySplash,
      body: Center(
        child: Stack(
          children: [
            Image.asset('assets/images/image1.png'),
            Positioned(
              bottom: 1.sp,
              right: 20.sp,
              left: 20.sp,
              child: Image.asset('assets/images/image2.png'),
            ),
          ],
        ),
      ),
    );
  }
}
