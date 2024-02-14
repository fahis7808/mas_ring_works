import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/provider/inventory_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../../util/snack_bar.dart';
import '../../widget/custom_button/custom_button.dart';
import '../../widget/custom_dropdown_field.dart';
import '../../widget/custom_textfield.dart';

class AddInventory extends StatelessWidget {
  const AddInventory({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => InventoryProvider(),
      child: Consumer<InventoryProvider>(
        builder: (context,data,_) {
          final item = data.itemModel;
          return Scaffold(
            appBar: CustomAppBar(title: "Add Inventory"),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      value: item.itemName,
                      labelText: "Item Name",
                      onChanged: (val) {
                        item.itemName =val;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),  Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            value: item.itemSize?.toString() ?? "",
                            labelText: "Item size",
                            onChanged: (val) {
                              item.itemSize = val.toDouble();
                            },
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: CustomDropdownField<String>(
                            items: ["Centimeter (cm)","Meter (m)","Inch (in)","Foot (ft)","Yard (yd)"],
                            onChanged: (val) {
                              item.itemType = val;
                            },
                            value: item.itemType,
                            labelText: "Size Type",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),  CustomTextField(
                      value: item.makingCost?.toString() ?? "",
                      labelText: "Item Making cost",
                      onChanged: (val) {
                        item.makingCost = val.toDouble();
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: CustomButton(text: "ADD ITEM", onTap: () {
                        data.saveData().then((value) {
                          if(value =="Success"){
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
        }
      ),
    );
  }
}
