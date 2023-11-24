import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/payment/add_advance.dart';
import 'package:mas_ring_works/View/screen/payment/on_tap/on_tap.dart';
import 'package:mas_ring_works/View/screen/payment/payment_card.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_floating_action_button.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Payment Details"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(itemBuilder: (context,index){
          return InkWell(onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>OnCardTap()));
          },child: PaymentCard());
        }),
      ),
      floatingActionButton: CustomFloatingActionButton(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=> AddAdvancePayment()));
      }),
    );
  }
}
