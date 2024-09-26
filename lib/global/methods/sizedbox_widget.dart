
import 'package:flutter/material.dart';

SizedBox sizedBoxH(double height){
  return SizedBox(height: height);
}

SizedBox sizedBoxW(double width){
  return SizedBox(width: width);
}

Size size(context){
  return MediaQuery.sizeOf(context);
}

Divider customDivider = const Divider(
  height: 0.5,
  color: Color(0xFFA3A1A1),
);