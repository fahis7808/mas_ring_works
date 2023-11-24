import 'package:flutter/cupertino.dart';
import 'package:mas_ring_works/View/screen/widget/custom_card.dart';
import 'package:mas_ring_works/View/screen/widget/title_text_widget.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

class OnTapCArd extends StatelessWidget {
  const OnTapCArd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleTextWidget(title: "Date", text: "24/11/2023"),
              TitleTextWidget(title: "Amount", text: "1000")
            ],
          ),
      SizedBox(height: 10,),
      RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Reason : ",style: AppFont.grayTextTitle,
              ),
              TextSpan(
                text: 'nothing',
                style: AppFont.smallTitle
              ),
            ],
          ),
      ),

      ],
    ),
        ));
  }
}
