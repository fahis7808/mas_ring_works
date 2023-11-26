import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';

import '../../widget/custom_button/custom_button.dart';
import '../../widget/custom_dropdown_field.dart';
import '../../widget/custom_textfield.dart';

class AddInventory extends StatelessWidget {
  const AddInventory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add Inventory"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                value: "",
                labelText: "Item Name",
                onChanged: (val) {},
              ),
              SizedBox(
                height: 10,
              ),  Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      value: "",
                      labelText: "Item size",
                      onChanged: (val) {},
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomDropdownField<String>(
                      items: ["Centimeter (cm)","Meter (m)","Inch (in)","Foot (ft)","Yard (yd)"],
                      onChanged: (val) {},
                      value: "",
                      labelText: "Size Type",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),  CustomTextField(
                value: "",
                labelText: "Item Making cost",
                onChanged: (val) {},
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomButton(text: "ADD ITEM", onTap: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
