
// ignore_for_file: must_be_immutable
import 'package:blood_bank/global/methods/sizedbox_widget.dart';
import 'package:flutter/material.dart';
import '../constants/color_resources.dart';
import '../style/montserrat.dart';

class CustomButtonWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final double? horizontal;
  final double? vertical;
  final String title;
  Function() onTap;
  CustomButtonWidget({
    Key? key,
    this.height,
    this.width,
    this.horizontal,
    this.vertical,
    required this.title,
    this.radius,
    required this.onTap
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal ?? 0, vertical: vertical ?? 0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorRes.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
          maximumSize: Size(
              width ?? size(context).width,
              height ?? 45
          ),
          minimumSize: Size(
              width ?? size(context).width,
              height ?? 45
          ),
        ),
        child: Center(
          child: Text(title,
            style: montserratSemiBold16.copyWith(
                color: ColorRes.white
            ),
          ),
        ),
      ),
    );
  }
}

// class RedButton extends StatelessWidget {
//   const RedButton({
//     Key? key,
//     this.onTap,
//     required this.text,
//     required this.buttonColor,
//     required this.textColor,
//   }) : super(key: key);
//
//   final VoidCallback? onTap;
//   final String text;
//   final Color buttonColor;
//   final Color textColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: buttonColor,
//         elevation: 0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//       onPressed: onTap,
//       child: SizedBox(
//         width: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           child: Center(
//             child: Text(
//               text,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: latoBold.copyWith(
//                   color: textColor
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }