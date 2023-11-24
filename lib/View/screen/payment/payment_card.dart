import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/widget/custom_card.dart';
import 'package:mas_ring_works/View/screen/widget/delete_edit_buttom.dart';
import 'package:mas_ring_works/View/screen/widget/title_text_widget.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        child: Row(
      children: [
        Column(
          children: [
            Icon(
              Icons.person,
              size: 70,
              color: AppColors.gray,
            ),
            Text("Fahis",style: AppFont.smallTitle,)
          ],
        ),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Aboobacker Fahis UP",style: AppFont.gridText,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TitleTextWidget(title: "Working days", text: "20"),
                TitleTextWidget(title: "Total Salary", text: "2000"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TitleTextWidget(title: "Advance Paid", text: "500"),
                TitleTextWidget(title: "Balance     ", text: "1500"),
              ],
            ),
          ],
        )),
        DeleteEditButton(onDelete: (){}, onEdit: (){})
      ],
    ));
  }
}
