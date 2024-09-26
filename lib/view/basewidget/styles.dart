
import 'package:blood_bank/global/style/montserrat.dart';
import 'package:flutter/material.dart';
import '../../global/constants/color_resources.dart';

InputDecoration inputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderSide: const BorderSide(width: 1, color: ColorRes.hintTextColor),
    borderRadius: BorderRadius.circular(8),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: ColorRes.hintTextColor, width: 1),
    borderRadius: BorderRadius.circular(8),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(width: 1, color: ColorRes.hintTextColor),
    borderRadius: BorderRadius.circular(8),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(width: 1, color: ColorRes.hintTextColor),
    borderRadius: BorderRadius.circular(8),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(width: 1, color: ColorRes.hintTextColor),
    borderRadius: BorderRadius.circular(8),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(width: 1, color: ColorRes.hintTextColor),
    borderRadius: BorderRadius.circular(8),
  ),
);