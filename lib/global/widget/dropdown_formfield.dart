
import 'package:blood_bank/global/style/montserrat.dart';
import 'package:blood_bank/view/basewidget/styles.dart';
import 'package:flutter/material.dart';
import '../constants/color_resources.dart';

class CustomDropDownFormField extends StatefulWidget {
  final String? titleText;
  final TextStyle? titleStyle;
  final String value;
  final double? height;
  final double? menuMaxHeight;
  final bool? isDense;
  final List<String> items;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final InputDecoration? decoration;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const CustomDropDownFormField({
    Key? key,
    this.titleText,
    this.titleStyle,
    required this.value,
    this.decoration,
    this.height,
    this.menuMaxHeight,
    required this.items,
    required this.onChanged,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.sufixIcon,
    this.validator,
    this.contentPadding,
    this.isDense = false,
  }) : super(key: key);

  @override
  State<CustomDropDownFormField> createState() => _CustomDropDownFormFieldState();
}

class _CustomDropDownFormFieldState extends State<CustomDropDownFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleText == null
            ? const SizedBox.shrink()
            : Text(widget.titleText ?? "",
            style: widget.titleStyle ??  montserratSemiBold.copyWith(color: ColorRes.black)
        ),
        /// When I give the title text it will take the sizedbox
        widget.titleText != null ? const SizedBox(height: 5) : const SizedBox.shrink(),
        DropdownButtonFormField<String>(
          items: widget.items.map((itemValue) => DropdownMenuItem<String>(
            value: itemValue,
            child: Text(
              itemValue,
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: montserratMedium
            ),
          ),
          ).toList(),
          // menuMaxHeight: widget.menuMaxHeight ?? 200,
          value: widget.value,
          isExpanded: true,
          decoration: inputDecoration.copyWith(
            isDense: widget.isDense,
            hintText: widget.hintText,
            contentPadding: widget.contentPadding,
            labelText: widget.labelText,
            prefixIcon: widget.prefixIcon,
            // suffixIcon: widget.sufixIcon ?? Icon(
            //   Icons.arrow_circle_down_rounded,
            //   color: ColorRes.grey,
            // )
          ),
          icon: widget.sufixIcon ?? const Icon(
            Icons.arrow_drop_down,
            color: ColorRes.grey,
          ),
          onChanged: widget.onChanged,
          validator: widget.validator ?? (val){
            if(val!.isEmpty){
              if (widget.labelText != null || widget.labelText == "Select"){
                return "${widget.labelText} is required!";
              } else if(widget.titleText != null || widget.titleText == "Select"){
                return "${widget.titleText} is required!";
              } else if(widget.hintText != null || widget.hintText == "Select"){
                return "${widget.hintText} is required!";
              }
              return "This filed is required!";
            }
            return null;
          },
          style: montserratMedium.copyWith(color: ColorRes.grey),
        ),
      ],
    );
  }
}