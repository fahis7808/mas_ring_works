import 'package:flutter/cupertino.dart';
import 'package:mas_ring_works/View/screen/widget/custom_card.dart';
import 'package:mas_ring_works/View/screen/widget/delete_edit_buttom.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

class InventoryCard extends StatelessWidget {
  const InventoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          Text("6 Feet Ring",style: AppFont.largeText ,),
        DeleteEditButton(onDelete: (){}, onEdit: (){})
      ],
    ),
        ));
  }
}
