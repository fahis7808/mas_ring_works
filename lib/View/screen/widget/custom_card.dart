import 'package:flutter/cupertino.dart';

import '../../../constants/app_colors.dart';

class CustomCard extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  const CustomCard({Key? key, this.margin, this.padding, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding:padding ?? EdgeInsets.all(10),
        child: child,
      ),
    );
  }
}
