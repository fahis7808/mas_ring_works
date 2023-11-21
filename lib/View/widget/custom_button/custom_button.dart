import 'package:flutter/material.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

import '../../../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final void Function() onTap;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  const CustomButton(
      {this.color,
      super.key,
      required this.text,
      required this.onTap,
      this.padding,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.symmetric(vertical: 20),
        // height: 60 ,
        decoration: BoxDecoration(
            color: color ?? AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.borderColors,width: 1)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: textStyle ?? AppFont.buttonText,
            ),
          ],
        ),
      ),
    );
  }
}
