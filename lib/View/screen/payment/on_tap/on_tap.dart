import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/payment/on_tap/on_tap_card.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';

class OnCardTap extends StatelessWidget {
  const OnCardTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Aboobacker Fahis"),
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context,index){
return OnTapCArd();
          }))
        ],
      ),
    );
  }
}
