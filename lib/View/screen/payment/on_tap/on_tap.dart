import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/payment/on_tap/on_tap_card.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';
import 'package:mas_ring_works/model/staff_model.dart';

class OnCardTap extends StatelessWidget {
  final StaffModel staffData;
  const OnCardTap({super.key, required this.staffData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: ""),
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Text(
            "ABOOBACKER FAHIS",
            style: AppFont.whiteLargeText,
          ),
          Container(
            height: 80,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.borderColors,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Working Days",
                      style: AppFont.whiteMediumText,
                    ),
                    Text(
                      staffData.totalWorkingDays?.toString() ?? "0",
                      style: AppFont.cardTitle,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Advance",
                      style: AppFont.whiteMediumText,
                    ),
                    Text(
                      staffData.advancePaid?.toString()?? "",
                      style: AppFont.cardTitle,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Balance",
                      style: AppFont.whiteMediumText,
                    ),
                    Text(
                      staffData.balanceSalary?.toString()?? "",
                      style: AppFont.cardTitle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount: staffData.paymentList?.length,
                    itemBuilder: (context, index) {
                  return  OnTapCArd(paymentModelList: staffData.paymentList![index],);
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
