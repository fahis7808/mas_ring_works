import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/inventory/add_inventory.dart';
import 'package:mas_ring_works/View/screen/inventory/inventory_card.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_floating_action_button.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Inventory",),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(itemBuilder: (context,index){
          return InventoryCard();
        }),
      ),
      floatingActionButton: CustomFloatingActionButton(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => AddInventory()));
      }),
    );
  }
}
