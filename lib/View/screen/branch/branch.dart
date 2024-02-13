import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/branch/add_branch.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_floating_action_button.dart';
import 'package:mas_ring_works/provider/branch_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../widget/custom_card.dart';
import '../widget/delete_edit_buttom.dart';
import '../widget/title_text_widget.dart';

class BranchPage extends StatelessWidget {
  const BranchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => BranchProvider(),
      child: Consumer<BranchProvider>(builder: (context, data, _) {
        return Scaffold(
          appBar: CustomAppBar(
            title: "Branch",
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
                itemCount: data.branchList.length,
                itemBuilder: (context, index) {
                  final val = data.branchList[index];
                  return CustomCard(
                      child: Row(
                    children: [
                      Icon(
                        Icons.house,
                        size: 80,
                        color: AppColors.gray,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              val.branchName.toString(),
                              style: AppFont.gridText,
                            ),
                            Text(
                              val.branchMobile.toString(),
                              style: AppFont.mediumText,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TitleTextWidget(
                                    title: "Location",
                                    text: val.branchLocation.toString()),
                                DeleteEditButton(onDelete: () {}, onEdit: () {})
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ));
                }),
          ),
          floatingActionButton: CustomFloatingActionButton(onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AddBranch())).then((value) => data.getDataFromFireStore());
          }),
        );
      }),
    );
  }
}
