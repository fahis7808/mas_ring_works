import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/dashboard/grid_view.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_button.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey Fahise !",
                        style: AppFont.whiteMediumText,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Manage your \nBusiness !",
                        style: AppFont.whiteLargeText,
                      ),
                    ],
                  ),
                  Icon(
                    Icons.person,
                    size: 60,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CustomButton(
                text: "Daily Business",
                onTap: () {},
                color: AppColors.borderColors,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 35,),
                        Text("Business Data",style: AppFont.title,),
                        SizedBox(height: 30,),
                        Expanded(child: GridViewPage())
                      ],
                    ),
                  ),
            ))
          ],
        ),
      ),
    );
  }
}