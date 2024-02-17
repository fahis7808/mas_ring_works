import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/task/add_task.dart';
import 'package:mas_ring_works/View/widget/circular_progress_indicator.dart';
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
    return ChangeNotifierProvider(
      create: (ctx) => TaskProvider(),
      child: Consumer<TaskProvider>(builder: (context, data, _) {
        return Scaffold(
          appBar: const CustomAppBar(title: "Tasks"),
          body: data.isLoading
              ? const CustomCircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: data.taskList.isEmpty
                      ? Center(
                          child: Text(
                            "No Data Found",
                            style: AppFont.title,
                          ),
                        )
                      : ListView.builder(
                          itemCount: data.taskList.length,
                          itemBuilder: (context, index) {
                            final val = data.taskList[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: AppColors.cardColor,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20))),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              topLeft: Radius.circular(20))),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15.0),
                                              child: Text(
                                                val.taskName.toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: AppFont.cardTitle,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TitleTextWidget(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                title: "Vehicle Number",
                                                text: val.vehicleNumber
                                                    .toString(),
                                              ),
                                              const StatusCard(
                                                  status: "STARTED")
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TitleTextWidget(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  title: "Customer",
                                                  text: val.customerName
                                                      .toString()),
                                              TitleTextWidget(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  title: "Location",
                                                  text:
                                                      val.location.toString()),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TitleTextWidget(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  title: "Date",
                                                  text:
                                                      val.workDate.toString()),
                                              DeleteEditButton(
                                                  onDelete: () {},
                                                  onEdit: () {})
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
          floatingActionButton: CustomFloatingActionButton(onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const AddTask()));
          }),
        );
      }),
    );
  }
}
