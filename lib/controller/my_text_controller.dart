import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class MyTextController{

  static final MyTextController _instance = MyTextController._internal();

  factory MyTextController(){
    return _instance;
  }

  MyTextController._internal();

  // ==@SignUp
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController lastDateController = TextEditingController();
  TextEditingController timeDonarController = TextEditingController();

  // ==@Verify
  TextEditingController smsCodeController = TextEditingController();

  // ==@ Blood Post Screen
  TextEditingController patientProblemsCon = TextEditingController();
  TextEditingController bloodVolumeCon = TextEditingController();
  TextEditingController donationDateCon = TextEditingController();
  TextEditingController donationTimeCon = TextEditingController();
  TextEditingController locationOfBloodDonationCon = TextEditingController();
  TextEditingController mobileNoCon = TextEditingController();
  TextEditingController referenceMobileNoCon = TextEditingController();
}

// ==@SignUp
final showFormat = DateFormat("dd-MM-yyyy");
String gender = "Select";
String group = "Select";
String division = "Select";
String district = "Select";
String upozilas = "Select";
XFile? selectedImage;

// ==@ Blood Post Screen
String patientGender = "Select";
String patientBloodGroup = "Select";
String hemoglobin = "Select";