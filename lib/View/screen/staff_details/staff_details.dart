import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/staff_details/staff_Card.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';

class StaffDetails extends StatelessWidget {
  const StaffDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Staff Details",),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(itemBuilder: (context,index){
          return StaffCard();
        }),
      ),
    );
  }
}
