
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mas_ring_works/constants/app_colors.dart';

class AppFont {
  static TextStyle textFieldLabel = GoogleFonts.inter(
      fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.text);

  static TextStyle textFieldText = GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: AppColors.textFieldText);

  static TextStyle buttonText = GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: Colors.white);
}
