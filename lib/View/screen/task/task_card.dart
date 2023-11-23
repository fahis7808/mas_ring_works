import 'package:flutter/cupertino.dart';
import 'package:mas_ring_works/View/screen/widget/delete_edit_buttom.dart';
import 'package:mas_ring_works/View/screen/widget/status_card.dart';
import 'package:mas_ring_works/View/screen/widget/title_text_widget.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "first task",
                      style: AppFont.cardTitle,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleTextWidget(
                        title: "Vehicle Number",
                        text: "KL10AU7808",
                      ),
                      StatusCard(status: "STARTED")
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleTextWidget(title: "Branch", text: "Main branch"),
                      TitleTextWidget(title: "Location", text: "Manjeri")
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleTextWidget(title: "Date", text: "12/11/2023"),
                      DeleteEditButton(onDelete: (){}, onEdit: (){})
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
