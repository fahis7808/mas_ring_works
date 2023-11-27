import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisSpacing: 5,
      mainAxisSpacing: 15,
      crossAxisCount: 4,children: [
      for(int i=0; i<= 7; i++)
        InkWell(
          onTap: (){},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.portrait,size: 90,),
              Text("Staff \nDetails",style: AppFont.gridText,textAlign: TextAlign.center,)
            ],),
        ),
    ],);
  }
}
