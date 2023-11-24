import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/vehicle/add_vehicle.dart';
import 'package:mas_ring_works/View/screen/vehicle/vehicle_card.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_floating_action_button.dart';

class VehiclePage extends StatelessWidget {
  const VehiclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Vehicle"),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(itemBuilder: (context, index) {
          return VehicleCard();
        }),
      ),
      floatingActionButton: CustomFloatingActionButton(onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddVehicle()));
      }),
    );
  }
}
