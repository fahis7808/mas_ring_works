import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/branch/branch.dart';
import 'package:mas_ring_works/View/screen/inventory/inventory_page.dart';
import 'package:mas_ring_works/View/screen/payment/payment_history.dart';
import 'package:mas_ring_works/View/screen/staff_details/staff_details.dart';
import 'package:mas_ring_works/View/screen/task/task_page.dart';
import 'package:mas_ring_works/View/screen/vehicle/vehicle_page.dart';

class DashboardProvider extends ChangeNotifier{

  List<String> gridName = ["Task","Staff","Vehicle","Branch","Payment","Inventory"];
  List<IconData> iconList = [Icons.task_outlined,Icons.person_outline,CupertinoIcons.car_detailed,CupertinoIcons.building_2_fill,CupertinoIcons.money_dollar,Icons.inventory_2_outlined,];
  List onTap = [TaskPage(),StaffDetails(),VehiclePage(),BranchPage(),PaymentHistory(),InventoryPage()];

}