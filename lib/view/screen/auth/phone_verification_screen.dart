// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:blood_bank/controller/my_text_controller.dart';
import 'package:blood_bank/global/methods/button.dart';
import 'package:blood_bank/global/methods/show_toast.dart';
import 'package:blood_bank/global/methods/sizedbox_widget.dart';
import 'package:blood_bank/global/style/montserrat.dart';
import 'package:blood_bank/view/screen/auth/signup_screen.dart';
import 'package:blood_bank/view/screen/deshboard/deshboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../controller/auth_crud/auth_repo.dart';
import '../../../global/constants/color_resources.dart';
import '../../../global/style/lato_styles.dart';

class PhoneVerificationScreen extends StatelessWidget {
  String verify;
  PhoneVerificationScreen({super.key, required this.verify});

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;


  TextEditingController phoneController =  MyTextController().phoneController;
  TextEditingController smsCodeController =  MyTextController().smsCodeController;

  @override
  Widget build(BuildContext context) {
    var code = smsCodeController.text.trim();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Spacer(
                  flex: 1,
                ),
                const Text("Phone Verification", style: latoBold24),
                sizedBoxH(10),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: const Text("We need to register your phone before getting started!",
                    style: latoRegular18,
                    textAlign: TextAlign.center,
                  ),
                ),
                sizedBoxH(30),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  textStyle: montserratSemiBold,
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 40,
                    fieldWidth: 40,
                    inactiveColor: ColorRes.black,
                    selectedColor: ColorRes.primaryColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: false,
                  //errorAnimationController: errorController,
                  controller: smsCodeController,
                  onCompleted: (v) {

                  },
                  onChanged: (val) {
                    code = val;
                  },
                  beforeTextPaste: (text) {
                    log("Allowing to paste $text");
                    return true;
                  },
                ),
                sizedBoxH(30),
                CustomButtonWidget(
                  onTap: () async {
                    // Check if the entered phone number is already registered
                    final isRegistered = await AuthRepo.checkIfPhoneNumberIsRegistered("+88${phoneController.text.trim()}");
                    if(isRegistered){
                      Get.to(()=> const DashboardScreen());
                    }
                    else{
                      // Phone number is not registered, proceed with phone verification
                      try{
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(
                            verificationId: verify,
                            smsCode: code
                        );
                        await firebaseAuth.signInWithCredential(credential);
                        Get.to(()=> const SignUpScreen());
                        showSuccessToast("Verification Success");
                      } catch(e){
                        showFailedToast("Wrong OTP");
                      }
                    }
                  },
                  title: "Verify phone number",
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ));
  }
}