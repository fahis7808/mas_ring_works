import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/widget/custom_card.dart';
import 'package:mas_ring_works/View/screen/widget/delete_edit_buttom.dart';
import 'package:mas_ring_works/View/screen/widget/title_text_widget.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

class BranchCard extends StatelessWidget {
  const BranchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        child: Row(
      children: [
        Icon(
          Icons.house,
          size: 80,
          color: AppColors.gray,
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "MAIN BRANCH",
                style: AppFont.gridText,
              ),
              Text(
                "8893288945",
                style: AppFont.mediumText,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleTextWidget(title: "Location", text: "Veemboor"),
                  DeleteEditButton(onDelete: (){}, onEdit: (){})
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
