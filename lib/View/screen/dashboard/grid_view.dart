import 'package:flutter/material.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 20),
        itemCount: 8,
        itemBuilder: (context, index) {
          return InkWell(
            child: Column(
              children: [
                Icon(
                  Icons.group,
                  size: 50,
                ),
                Text("Staff Data",style: AppFont.gridText,)
              ],
            ),
          );
        });
  }
}
