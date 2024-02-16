import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/staff_details/add_staff.dart';
import 'package:mas_ring_works/View/screen/staff_details/staff_profile_page.dart';
import 'package:mas_ring_works/View/widget/circular_progress_indicator.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_floating_action_button.dart';
import 'package:mas_ring_works/provider/staff_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../widget/status_card.dart';

class StaffDetails extends StatelessWidget {
  const StaffDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => StaffProvider(),
      child: Consumer<StaffProvider>(builder: (context, data, _) {
        return Scaffold(
          appBar: CustomAppBar(
            title: "Staff Details",
          ),
          body:data.isLoading ? CustomCircularProgressIndicator() : Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
                itemCount: data.staffList.length,
                itemBuilder: (context, index) {
                  final val = data.staffList[index];
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => StaffProfilePage(staffData: val,)));
                      },
                      child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: AppColors.cardColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Column(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: 70,
                                      color: AppColors.gray,
                                    ),
                                    /* Text(
                                      "Fahis",
                                      style: AppFont.smallTitle,
                                    )*/
                                  ],
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      val.name.toString(),
                                      style: AppFont.gridText,
                                    ),
                                    Text(
                                      val.phoneNumber.toString(),
                                      style: AppFont.mediumText,
                                    ),
                                  ],
                                )),
                                Column(
                                  children: [
                                    StatusCard(status: "ON WORK"),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.delete,
                                              color: AppColors.gray,
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.edit,
                                              color: AppColors.gray,
                                            ))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )));
                }),
          ),
          floatingActionButton: CustomFloatingActionButton(
            onTap: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegisterStaff()))
                  .then((value) => data.getDataFromFireStore());
            },
          ),
        );
      }),
    );
  }
}
