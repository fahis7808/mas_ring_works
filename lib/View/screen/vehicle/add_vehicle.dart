import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_dropdown_field.dart';
import 'package:mas_ring_works/provider/vehicle_provider.dart';
import 'package:mas_ring_works/util/snack_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../widget/custom_button/custom_button.dart';
import '../../widget/custom_textfield.dart';

class AddVehicle extends StatelessWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Add Vehicle",
      ),
      body: ChangeNotifierProvider(
        create: (ctx) => VehicleProvider(),
        child: Consumer<VehicleProvider>(
          builder: (context,data,_) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  children: [
                    const CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: 90,
                        color: AppColors.gray,
                      ),
                      radius: 75,
                      backgroundColor: AppColors.cardColor,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      value: data.vehicleModel.vehicleNumber,
                      labelText: "Vehicle Number",
                      onChanged: (val) {
                        data.vehicleModel.vehicleNumber = val;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDropdownField<String>(
                      items: const ["Large","Medium","Small"],
                      onChanged: (val) {
                        data.vehicleModel.vehicleType = val;
                      },
                      value: data.vehicleModel.vehicleType,
                      labelText: "Vehicle Type",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      value: data.vehicleModel.driverName,
                      labelText: "Driver Name",
                      onChanged: (val) {
                        data.vehicleModel.driverName = val;
                      },
                    ),const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      value: data.vehicleModel.driverNumber,
                      labelText: "Driver Mobile",
                      onChanged: (val) {
                        data.vehicleModel.driverNumber = val;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDropdownField<String>(
                      items: const ["Own Vehicle","Rental"],
                      onChanged: (val) {
                        data.vehicleModel.vehicleUsage = val;
                      },
                      value: data.vehicleModel.vehicleUsage,
                      labelText: "Vehicle Usage",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      value: data.vehicleModel.loadCapacity?.toString() ?? "",
                      labelText: "Maximum Load Capacity",
                      onChanged: (val) {
                        data.vehicleModel.loadCapacity = val.toDouble();
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: CustomButton(text: "ADD STAFF", onTap: () {
                        data.saveData().then((value){
                          if(value == "Success"){
                            Navigator.pop(context);
                            data.getDataFromFireStore();
                          }else{
                            showSnackBar(context, "Something went wrong");
                          }
                        });
                      }),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
