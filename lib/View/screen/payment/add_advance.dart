import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/widget/custom_card.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';

import '../../widget/custom_button/custom_button.dart';
import '../../widget/custom_dropdown_field.dart';
import '../../widget/custom_textfield.dart';

class AddAdvancePayment extends StatelessWidget {
  const AddAdvancePayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add Staff"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomDropdownField<String>(
                items: [],
                onChanged: (val) {},
                value: "",
                labelText: "Select Staff",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                value: "",
                labelText: "Mobile Number",
                onChanged: (val) {},
              ),
              const SizedBox(
                height: 15,
              ),
              CustomCard(child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CustomTextField(
                          value: "",
                          labelText: "Date",
                          onChanged: (val) {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          value: "",
                          labelText: "Reason",
                          onChanged: (val) {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                readOnly: true,
                                value: "",
                                labelText: "Balance",
                                onChanged: (val) {},
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomTextField(
                                value: "",
                                labelText: "Advance",
                                onChanged: (val) {},
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomButton(text: "ADD", onTap: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
