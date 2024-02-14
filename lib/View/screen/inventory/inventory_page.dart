import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/inventory/add_inventory.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_floating_action_button.dart';
import 'package:mas_ring_works/provider/inventory_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_fonts.dart';
import '../widget/custom_card.dart';
import '../widget/delete_edit_buttom.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=>InventoryProvider(),
      child: Consumer<InventoryProvider>(
        builder: (context,data,_) {
          return Scaffold(
            appBar: CustomAppBar(title: "Inventory",),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: data.itemList.length,
                  itemBuilder: (context,index){
                    final val = data.itemList[index];
                return CustomCard(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(val.itemName.toString(),style: AppFont.largeText ,),
                          DeleteEditButton(onDelete: (){}, onEdit: (){})
                        ],
                      ),
                    ));
              }),
            ),
            floatingActionButton: CustomFloatingActionButton(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => AddInventory())).then((value) => data.getDataFromFireStore());
            }),
          );
        }
      ),
    );
  }
}
