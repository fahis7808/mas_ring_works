import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/payment/add_advance.dart';
import 'package:mas_ring_works/View/screen/payment/on_tap/on_tap.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_floating_action_button.dart';
import 'package:mas_ring_works/provider/payment_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../widget/custom_card.dart';
import '../widget/title_text_widget.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => PaymentProvider(),
      child: Consumer<PaymentProvider>(
        builder: (context,data,_) {
          return Scaffold(
            appBar: CustomAppBar(title: "Payment Details"),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: data.paymentList.length,
                  itemBuilder: (context,index){
                    final val = data.paymentList[index];
                return InkWell(onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>OnCardTap(staffData: val,)));
                },child: CustomCard(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.person,
                              size: 70,
                              color: AppColors.gray,
                            ),
                            // Text("Fahis",style: AppFont.smallTitle,)
                          ],
                        ),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(val.name.toString(),style: AppFont.gridText,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TitleTextWidget(title: "Working days", text: val.totalWorkingDays?.toString() ?? ""),
                                TitleTextWidget(title: "Total Salary", text: val.totalSalary?.toString() ?? "0.0"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TitleTextWidget(title: "Advance Paid", text: val.advancePaid.toString()),
                                TitleTextWidget(title: "Balance     ", text: val.balanceSalary.toString()),
                              ],
                            ),
                          ],
                        )),
                        // DeleteEditButton(onDelete: (){}, onEdit: (){})
                      ],
                    )));
              }),
            ),
            floatingActionButton: CustomFloatingActionButton(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> AddAdvancePayment())).then((value) => data.getStaffList());
            }),
          );
        }
      ),
    );
  }
}
