// ignore_for_file: invalid_use_of_visible_for_testing_member, unnecessary_null_comparison

import 'package:blood_bank/controller/my_text_controller.dart';
import 'package:blood_bank/global/constants/images.dart';
import 'package:blood_bank/global/methods/button.dart';
import 'package:blood_bank/global/methods/show_toast.dart';
import 'package:blood_bank/global/methods/sizedbox_widget.dart';
import 'package:blood_bank/global/widget/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'phone_verification_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController phoneController =  MyTextController().phoneController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  validateMobile(String value) {
    if (value.isEmpty) {
      return 'Phone number is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sizedBoxH(250),
              // Image.asset(AllImages.iconLogo, width: 100, fit: BoxFit.fill),
              sizedBoxH(50),
              CustomTextFormField(
                keyboardType: TextInputType.phone,
                titleText: "Phone Number",
                controller: phoneController,
                isDense: true,
                validator: (val){
                  return validateMobile(val!);
                },
              ),
              const SizedBox(height: 40,),
              CustomButtonWidget(
                title: "Continue",
                onTap: () async {
                  if(formKey.currentState!.validate()){
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: "+88${phoneController.text.trim()}",
                      verificationCompleted: (PhoneAuthCredential credential){},
                      verificationFailed: (FirebaseAuthException e){},
                      codeSent: (String verificationId, int? resendToken){
                        Get.to(()=> PhoneVerificationScreen(verify: verificationId,));
                        showSuccessToast("Code Sending..");
                      },
                      codeAutoRetrievalTimeout: (String verificationId){},
                    );
                  } else{
                    showFailedToast("Please enter your phone number");
                  }
                },
              ),
              Expanded(child: Container()),
              Align(
                alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      AllImages.splashLogo,
                      width: 100,
                      fit: BoxFit.cover
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
