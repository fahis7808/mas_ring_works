import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/widget/custom_card.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../../widget/custom_button/custom_button.dart';
import '../../../widget/custom_textfield.dart';

class OnDailyCardTap extends StatelessWidget {
  const OnDailyCardTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "first task"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              CustomTextField(
                value: "",
                labelText: "Customer Name",
                onChanged: (val) {},
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                value: "",
                labelText: "Customer Mobile",
                onChanged: (val) {},
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                value: "",
                labelText: "Location",
                onChanged: (val) {},
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      value: "",
                      labelText: "Item",
                      onChanged: (val) {},
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomTextField(
                      value: "",
                      labelText: "Item Count",
                      onChanged: (val) {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      value: "",
                      labelText: "Start Time",
                      onChanged: (val) {},
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomTextField(
                      value: "",
                      labelText: "End Time",
                      onChanged: (val) {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      value: "",
                      labelText: "Over Time",
                      onChanged: (val) {},
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomTextField(
                      value: "",
                      labelText: "Charge",
                      onChanged: (val) {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                value: "",
                labelText: "Vehicle Number",
                onChanged: (val) {},
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                value: "",
                labelText: "Driver Name",
                onChanged: (val) {},
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                value: "",
                labelText: "Driver Mobile",
                onChanged: (val) {},
              ),
              SizedBox(
                height: 8,
              ),
              CustomCard(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Site Workers",
                    style: AppFont.cardText,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 5,
                      children: [
                        for(int i=0;i<=6;i++)
                        InputChip(
                          label: Text(
                            "Fahis up",
                            style: AppFont.statusColor,
                          ),
                          backgroundColor: AppColors.cardColor,
                          onDeleted: () {},
                          deleteIconColor: AppColors.primaryColor,
                          shape: StadiumBorder(),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomButton(text: "WORK FINISHED", onTap: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
