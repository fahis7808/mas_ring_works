import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/task/add_task.dart';
import 'package:mas_ring_works/View/screen/task/task_card.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_floating_action_button.dart';
import 'package:mas_ring_works/provider/task_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../widget/delete_edit_buttom.dart';
import '../widget/status_card.dart';
import '../widget/title_text_widget.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (ctx)=> TaskProvider(),
      child: Consumer<TaskProvider>(
        builder: (context,data,_) {
          return Scaffold(
            appBar: CustomAppBar(title: "Tasks"),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
              child: ListView.builder(
                  itemCount: data.taskList.length,
                  itemBuilder: (context,index){
                    final val = data.taskList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20), topLeft: Radius.circular(20))),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Text(
                                  "${val.customerName}_${val.siteName}" ?? "unknown site" ,
                                  style: AppFont.cardTitle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TitleTextWidget(
                                    title: "Vehicle Number",
                                    text: val.vehicleNumber.toString(),
                                  ),
                                  StatusCard(status: "STARTED")
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TitleTextWidget(title: "Date", text: val.workDate.toString()),
                                  TitleTextWidget(title: "Location", text: val.location.toString())
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  DeleteEditButton(onDelete: (){}, onEdit: (){})
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
            floatingActionButton: CustomFloatingActionButton(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> AddTask()));
            }),
          );
        }
      ),
    );
  }
}
