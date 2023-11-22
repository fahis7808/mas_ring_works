import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/staff_details/add_staff.dart';
import 'package:mas_ring_works/View/screen/staff_details/staff_Card.dart';
import 'package:mas_ring_works/View/screen/staff_details/staff_profile_page.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_floating_action_button.dart';

class StaffDetails extends StatelessWidget {
  const StaffDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Staff Details",
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(itemBuilder: (context, index) {
          return InkWell(onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (_) => StaffProfilePage()));
          },child: StaffCard());
        }),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => RegisterStaff()));
        },
      ),
    );
  }
}
