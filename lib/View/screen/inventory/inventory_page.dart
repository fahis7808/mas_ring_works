import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/inventory/add_inventory.dart';
import 'package:mas_ring_works/View/widget/circular_progress_indicator.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_floating_action_button.dart';
import 'package:mas_ring_works/provider/inventory_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_fonts.dart';
import '../widget/custom_card.dart';
import '../widget/delete_edit_buttom.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => InventoryProvider(),
      child: Consumer<InventoryProvider>(builder: (context, data, _) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: "Inventory",
          ),
          body: data.isLoading
              ? const CustomCircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: data.itemList.isEmpty
                      ? Center(
                          child: Text(
                            "No Data Found",
                            style: AppFont.title,
                          ),
                        )
                      : ListView.builder(
                          itemCount: data.itemList.length,
                          itemBuilder: (context, index) {
                            final val = data.itemList[index];
                            return CustomCard(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    val.itemName.toString(),
                                    style: AppFont.largeText,
                                  ),
                                  DeleteEditButton(
                                      onDelete: () {}, onEdit: () {})
                                ],
                              ),
                            ));
                          }),
                ),
          floatingActionButton: CustomFloatingActionButton(onTap: () {
            Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const AddInventory()))
                .then((value) => data.getDataFromFireStore());
          }),
        );
      }),
    );
  }
}
