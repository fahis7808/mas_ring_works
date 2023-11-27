import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/dashboard/daily_business/daily_card.dart';
import 'package:mas_ring_works/View/screen/dashboard/daily_business/on_daily_card_tap.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';

class DailyBusiness extends StatelessWidget {
  const DailyBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Today Work",),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(itemBuilder: (context,index){
          return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => OnDailyCardTap()));
              },
              child: DailyCard());
        }),
      ),
    );
  }
}
