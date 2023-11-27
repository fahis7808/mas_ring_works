import 'package:flutter/material.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';
import 'package:mas_ring_works/provider/grid_provider.dart';
import 'package:provider/provider.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DashboardProvider>(context);

    return GridView.builder(
      itemCount: data.gridName.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Number of columns
          crossAxisSpacing: 2, // Spacing between columns
          mainAxisSpacing: 30, // Spacing between rows
        ), itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) =>
          data.onTap[index]));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(data.iconList[index], size: 50, weight: 1),
            SizedBox(height: 15,),
            Text(
              data.gridName[index],
              style: AppFont.gridText,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    });
  }
}
