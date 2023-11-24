import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';

import '../../../constants/app_colors.dart';
import '../../widget/custom_button/custom_button.dart';
import '../../widget/custom_textfield.dart';

class AddBranch extends StatelessWidget {
  const AddBranch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Add Branch",),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 75,
                backgroundColor: AppColors.cardColor,
                child: Icon(
                  Icons.person,
                  size: 90,
                  color: AppColors.gray,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                value: "",
                labelText: "Branch Name",
                onChanged: (val){},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                value: "",
                labelText: "Branch Number",
                onChanged: (val){},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                value: "",
                labelText: "Branch Location",
                onChanged: (val){},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                value: "",
                labelText: "Branch Manager",
                onChanged: (val){},
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomButton(text: "ADD BRANCH", onTap: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
