import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/payment/on_tap/on_tap_card.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

class OnCardTap extends StatelessWidget {
  const OnCardTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: ""),
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Text("ABOOBACKER FAHIS",style: AppFont.whiteLargeText,),
          Container(
            height: 80,
            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.borderColors,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Working Days",style: AppFont.whiteMediumText,),
                    Text("15",style: AppFont.cardTitle,),
                  ],
                ),Column(
                  children: [
                    Text("Advance",style: AppFont.whiteMediumText,),
                    Text("5000",style: AppFont.cardTitle,),
                  ],
                ),Column(
                  children: [
                    Text("Balance",style: AppFont.whiteMediumText,),
                    Text("10000",style: AppFont.cardTitle,),
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
                child: ListView.builder(itemBuilder: (context,index){
return const OnTapCArd();
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
