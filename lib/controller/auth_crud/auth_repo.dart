
import 'dart:developer';
import 'dart:io';
import 'package:blood_bank/global/methods/methods.dart';
import 'package:blood_bank/view/screen/auth/signin_screen.dart';
import 'package:blood_bank/view/screen/deshboard/deshboard_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'auth_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firestore.collection('users');

class AuthRepo{

  /// ==@ SignUp
  static Future<Response> reqSignUp({
    String? name,
    String? email,
    String? phone,
    String? birthdate,
    String? lastDate,
    String? gender,
    String? bloodGroup,
    String? timeDonar,
    String? division,
    String? district,
    String? upozilas,
    String? image,

  }) async{
    Response response = const Response();
    String? phone = FirebaseAuth.instance.currentUser!.phoneNumber;
    DocumentReference documentReference = _collectionReference.doc(phone);

    Map<String, dynamic> preams = {};
    preams['name'] = name;
    preams['email'] = email;
    preams['phone'] = phone;
    preams['birthdate'] = birthdate;
    preams['lastDate'] = lastDate;
    preams['gender'] = gender;
    preams['bloodGroup'] = bloodGroup;
    preams['timeDonar'] = timeDonar;
    preams['division'] = division;
    preams['district'] = district;
    preams['upozilas'] = upozilas;

    try{
      if(image != null){
        final Reference stgReference = FirebaseStorage.instance.ref().child('user_images/$phone.jpg');
        final UploadTask uploadTask = stgReference.putFile(File(image));
        UserModel? userModel = await AuthRepo.fetchUserInfo();

        uploadTask.whenComplete(() async{
          preams['name'] = userModel!.name;
          preams['email'] = userModel.email;
          preams['phone'] = userModel.phone;
          preams['birthdate'] = userModel.birthdate;
          preams['lastDate'] = userModel.lastDate;
          preams['gender'] = userModel.gender;
          preams['bloodGroup'] = userModel.bloodGroup;
          preams['timeDonar'] = userModel.timeDonar;
          preams['division'] = userModel.division;
          preams['district'] = userModel.district;
          preams['upozilas'] = userModel.upozilas;
          preams['img_url'] = image;

          response.statusCode == 200;
          showToast("Profile Image Upload Successfully!");
          await documentReference.set(preams).whenComplete((){
            UserModel userModel = UserModel(
                name: name,
                email: email,
                phone: phone,
                birthdate: birthdate,
                lastDate: lastDate,
                gender: gender,
                bloodGroup: bloodGroup,
                timeDonar: timeDonar,
                division: division,
                district: district,
                upozilas: upozilas,
                image: image
            );
            log("==@ Profile Image: $image");
            log("==@ UserModel: $userModel");
            showToast("Profile Image Upload Successfully!");
          }).catchError((error){
            response.statusCode == 500;
            showToast("Failed!");
          });
        });

      } else{
        await documentReference.set(preams).whenComplete((){
          response.statusCode == 200;
          UserModel userModel = UserModel(
              name: name,
              email: email,
              phone: phone,
              birthdate: birthdate,
              lastDate: lastDate,
              gender: gender,
              bloodGroup: bloodGroup,
              timeDonar: timeDonar,
              division: division,
              district: district,
              upozilas: upozilas,
          );
          log("==@ UserModel: $userModel");
          Get.to(()=> const DashboardScreen());
          showToast("Account Create Successfully!");
        }).catchError((error){
          response.statusCode == 500;
          showToast("Account Create Failed!");
        });
      }
    } catch(error){
      response.statusCode == 500;
      showToast("Failed!");
    }

    log("==@ Status Code: ${response.statusCode}");
    log("==@ Personal Info: $preams");
    return response;
  }

  /// ==@ Edit Profile
  static Future<void> reqUpdateProfile({
    String? name,
    String? email,
    String? phone,
    String? birthdate,
    String? lastDate,
    String? gender,
    String? bloodGroup,
    String? timeDonar,
    String? division,
    String? district,
    String? upozilas,

  }) async{
    String? phone = FirebaseAuth.instance.currentUser!.phoneNumber;
    DocumentReference documentReference = _collectionReference.doc(phone);

    Map<String, dynamic> preams = {};
    preams['name'] = name;
    preams['email'] = email;
    preams['phone'] = phone;
    preams['birthdate'] = birthdate;
    preams['lastDate'] = lastDate;
    preams['gender'] = gender;
    preams['bloodGroup'] = bloodGroup;
    preams['timeDonar'] = timeDonar;
    preams['division'] = division;
    preams['district'] = district;
    preams['upozilas'] = upozilas;

    await documentReference.update(preams);
  }

  // Check if the entered phone number is already registered
  static Future<bool> checkIfPhoneNumberIsRegistered(String phoneNumber) async{
    final querySnapshot = await _collectionReference.where('phone', isEqualTo: phoneNumber).get();
    return querySnapshot.docs.isNotEmpty;
  }

  static Future<UserModel?> fetchUserInfo() async{
    String? phone = FirebaseAuth.instance.currentUser!.phoneNumber;
    DocumentSnapshot snapshot = await _collectionReference.doc(phone).get(const GetOptions(source: Source.server));

    if(snapshot.exists){
      Map<String, dynamic> preams = snapshot.data() as Map<String, dynamic>;
      log("Auth Fetch: $preams");
      return UserModel(
        name: preams['name'],
        phone: preams['phone'],
        email: preams['email'],
        password: preams['password'],
        birthdate: preams['birthdate'],
        lastDate: preams['lastDate'],
        gender: preams['gender'],
        bloodGroup: preams['bloodGroup'],
        timeDonar: preams['timeDonar'],
        division: preams['division'],
        district: preams['district'],
        upozilas: preams['upozilas'],
        image: preams['img_url'],
      );
    } else{
      return null;
    }
  }

  /// ==@ LogOut Account
  static Future<void> logOut() async{
    try{
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const SignInScreen());
    } catch(error){
      log("LogOut Error: $error");
    }
  }

}
