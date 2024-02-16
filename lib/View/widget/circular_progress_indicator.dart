import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final bool isButton;
  const CustomCircularProgressIndicator({super.key,  this.isButton = false});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [Padding(
        padding: isButton ? EdgeInsets.zero : EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: isButton ? Colors.white : AppColors.primaryColor,),
          ],
        ),
      )],
    );
  }
}
