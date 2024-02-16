import 'package:flutter/cupertino.dart';
import 'package:mas_ring_works/View/screen/widget/custom_card.dart';
import 'package:mas_ring_works/View/screen/widget/title_text_widget.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';
import 'package:mas_ring_works/model/payment_model.dart';

class OnTapCArd extends StatelessWidget {
  final PaymentModelList paymentModelList;
  const OnTapCArd({super.key, required this.paymentModelList});

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
              TitleTextWidget(title: "Date", text: paymentModelList.date?.toString() ?? ""),
              TitleTextWidget(title: "Amount", text: paymentModelList.amount?.toString() ?? "")
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
                text: paymentModelList.reason?.toString() ?? "",
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
