import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/task/add_task.dart';
import 'package:mas_ring_works/View/screen/task/task_card.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_floating_action_button.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Tasks"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
        child: ListView.builder(itemBuilder: (context,index){
          return TaskCard();
        }),
      ),
      floatingActionButton: CustomFloatingActionButton(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=> AddTask()));
      }),
    );
  }
}
