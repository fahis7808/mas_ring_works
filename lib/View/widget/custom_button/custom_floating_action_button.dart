import 'package:flutter/material.dart';
import 'package:mas_ring_works/constants/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final void Function() onTap;
  const CustomFloatingActionButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: onTap,  child: Icon(
     Icons.add,
      size: 30,
      color: Colors.white,
    ));
  }
}
