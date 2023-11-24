import 'package:flutter/cupertino.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

class TitleTextWidget extends StatelessWidget {
  final String title;
  final String text;
  const TitleTextWidget({Key? key, required this.title, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppFont.grayTextTitle,),
        Text(text,style: AppFont.smallTitle,)
      ],
    );
  }
}
