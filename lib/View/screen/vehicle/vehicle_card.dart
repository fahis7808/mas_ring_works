import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/widget/custom_card.dart';
import 'package:mas_ring_works/View/screen/widget/delete_edit_buttom.dart';
import 'package:mas_ring_works/View/screen/widget/status_card.dart';
import 'package:mas_ring_works/View/screen/widget/title_text_widget.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(child: Row(
      children: [
        Column(
          children: [
            Icon(Icons.car_crash,size: 70,color: AppColors.gray,),
            Text("TIPPER",style: AppFont.cardText,)
          ],
        ),
        SizedBox(width: 5,),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "KL10AU7808",
              style: AppFont.gridText,
            ),
            TitleTextWidget(title: "Driver", text: "Fahis")
          ],
        )),
        Column(
          children: [
            StatusCard(status: "ON WORK"),
            DeleteEditButton(onDelete: (){}, onEdit: (){})
          ],
        )
      ],
    ));
  }
}
