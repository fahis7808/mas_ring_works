import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/widget/status_card.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

class StaffCard extends StatelessWidget {
  const StaffCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                   Icon(
                    Icons.person,
                    size: 70,
                    color: AppColors.gray,
                  ),
                  Text(
                    "Fahis",
                    style: AppFont.smallTitle,
                  )
                ],
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Aboobacker Fahis",
                    style: AppFont.gridText,
                  ),
                  Text(
                    "8893288945",
                    style: AppFont.mediumText,
                  ),
                ],
              )),
              Column(
                children: [
                    StatusCard(status: "ON WORK"),
                  Row(children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: AppColors.gray,)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: AppColors.gray,))
                  ],)
                ],
              )
            ],
          ),
        ));
  }
}
