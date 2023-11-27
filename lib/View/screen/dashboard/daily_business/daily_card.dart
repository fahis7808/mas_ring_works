import 'package:flutter/cupertino.dart';
import 'package:mas_ring_works/View/screen/widget/custom_card.dart';
import 'package:mas_ring_works/View/screen/widget/delete_edit_buttom.dart';
import 'package:mas_ring_works/View/screen/widget/status_card.dart';
import 'package:mas_ring_works/View/screen/widget/title_text_widget.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';

class DailyCard extends StatelessWidget {
  const DailyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "first task",
                      style: AppFont.cardTitle,
                    ),
                  ),
                  StatusCard(
                    status: "STARTED",
                    color: AppColors.colorOne,
                    textStyle: TextStyle(
                        color: AppColors.borderColors,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height:270,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTextWidget(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            title: "Vehicle Number",
                            text: "KL10AU7808"),
                        TitleTextWidget(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            title: "Start Location",
                            text: "Veemboor"),
                        TitleTextWidget(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            title: "Customer",
                            text: "Customer one"),
                        TitleTextWidget(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            title: "Driver Name",
                            text: "Fahis"),
                        TitleTextWidget(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            title: "Item Count",
                            text: "10"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 270,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TitleTextWidget(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            title: "Item",
                            text: "6 ft Ring"),
                        TitleTextWidget(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            title: "Site Location",
                            text: "Manjeri"),
                        TitleTextWidget(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            title: "Customer Number",
                            text: "9747828806"),
                        TitleTextWidget(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            title: "Driver Number",
                            text: "8893288945"),
                        SizedBox(height: 40,child: DeleteEditButton(onDelete: (){}, onEdit: (){}))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
