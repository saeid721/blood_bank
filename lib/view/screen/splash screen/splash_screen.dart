import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/../../global/methods/sizedbox_widget.dart';
import '/../../view/basewidget/spinkit_three_bounce.dart';
import '/../../view/screen/auth/signin_screen.dart';
import '/../../view/screen/deshboard/deshboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../global/constants/color_resources.dart';
import '../../../global/constants/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ------------->>>> Splash Screen <<<<-----------------
    _route();
  }

  void _route() {
    Timer(const Duration(seconds: 5), () {
      // Check if the user is already authenticated (logged in)
      if (FirebaseAuth.instance.currentUser != null) {
        Get.off(() => const DashboardScreen());
      } else {
        // User is not logged in, navigate to SignInScreen
        Get.off(() => const SignInScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Column(
        children: [
          sizedBoxH(200),
          Image.asset(AllImages.splashLogo, width: 200, fit: BoxFit.cover),
          Expanded(child: Container()),
          const SpinKitThreeBounce(
            color: ColorRes.primaryColor,
            size: 25.0,
          ),
          sizedBoxH(50),
        ],
      ),
    );
  }
}
