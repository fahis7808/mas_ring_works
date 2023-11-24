import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/branch/add_branch.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_floating_action_button.dart';

import 'branch_card.dart';

class BranchPage extends StatelessWidget {
  const BranchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Branch",),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(itemBuilder: (context,index){
          return BranchCard();
        }),
      ),
      floatingActionButton: CustomFloatingActionButton(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => AddBranch()));
      }),
    );
  }
}
