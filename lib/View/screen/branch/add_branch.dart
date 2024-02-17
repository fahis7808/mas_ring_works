import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/circular_progress_indicator.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/provider/branch_provider.dart';
import 'package:mas_ring_works/util/snack_bar.dart';
import 'package:provider/provider.dart';

import '../../widget/custom_button/custom_button.dart';
import '../../widget/custom_textfield.dart';

class AddBranch extends StatelessWidget {
  const AddBranch({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => BranchProvider(),
      child: Consumer<BranchProvider>(builder: (context, data, _) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: "Add Branch",
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /* const CircleAvatar(
                      radius: 75,
                      backgroundColor: AppColors.cardColor,
                      child: Icon(
                        Icons.person,
                        size: 90,
                        color: AppColors.gray,
                      ),
                    ),*/
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    value: data.branchModel.branchName,
                    labelText: "Branch Name",
                    onChanged: (val) {
                      data.branchModel.branchName = val;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    value: data.branchModel.branchMobile,
                    labelText: "Branch Mobile",
                    onChanged: (val) {
                      data.branchModel.branchMobile = val;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    value: data.branchModel.branchLocation,
                    labelText: "Branch Location",
                    onChanged: (val) {
                      data.branchModel.branchLocation = val;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    value: data.branchModel.managerName,
                    labelText: "Branch Manager",
                    onChanged: (val) {
                      data.branchModel.managerName = val;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomButton(
                      widget: data.isButtonLoading ? CustomCircularProgressIndicator(isButton: true,) : null,
                        text: "ADD BRANCH",
                        onTap: () {
                          data.saveData().then((value) {
                            if(value == "Success"){
                              Navigator.pop(context);
                            }else{
                              showSnackBar(context, "Something went wrong");
                            }
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
