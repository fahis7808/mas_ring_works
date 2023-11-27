import 'package:flutter/cupertino.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';

class StatusCard extends StatelessWidget {
  final String status;
  final Color? color;
  final TextStyle? textStyle;
  const StatusCard({Key? key, required this.status, this.color, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color:color ?? AppColors.cardColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(status,style:textStyle ?? AppFont.statusColor,),
      ),
    );
  }
}
