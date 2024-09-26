
import 'dart:developer';
import 'package:blood_bank/global/constants/color_resources.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


  void printTest(String text){
    if(kDebugMode){
      print('\x1B[33m$text\x1B[0m');
    }
  }

  void showLog(String text){
    if(kDebugMode){
      log('\x1B[33m$text\x1B[0m');
    }
  }

  showSuccessToast(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorRes.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

showFailedToast(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorRes.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}