import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/vehicle/add_vehicle.dart';
import 'package:mas_ring_works/View/widget/circular_progress_indicator.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_floating_action_button.dart';
import 'package:mas_ring_works/provider/vehicle_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../widget/custom_card.dart';
import '../widget/delete_edit_buttom.dart';
import '../widget/status_card.dart';
import '../widget/title_text_widget.dart';

class VehiclePage extends StatelessWidget {
  const VehiclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => VehicleProvider(),
      child: Consumer<VehicleProvider>(builder: (context, data, _) {
        return Scaffold(
          appBar: const CustomAppBar(title: "Vehicle"),
          body: data.isLoading
              ? const CustomCircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: data.vehicleList.isEmpty
                      ? Center(
                          child: Text(
                            "No Data Found",
                            style: AppFont.title,
                          ),
                        )
                      : ListView.builder(
                          itemCount: data.vehicleList.length,
                          itemBuilder: (context, index) {
                            final val = data.vehicleList[index];
                            return CustomCard(
                                child: Row(
                              children: [
                                Column(
                                  children: [
                                    const Icon(
                                      Icons.car_crash,
                                      size: 70,
                                      color: AppColors.gray,
                                    ),
                                    Text(
                                      val.vehicleType.toString(),
                                      style: AppFont.cardText,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      val.vehicleNumber.toString(),
                                      style: AppFont.gridText,
                                    ),
                                    TitleTextWidget(
                                        title: "Driver",
                                        text: val.driverName.toString())
                                  ],
                                )),
                                Column(
                                  children: [
                                    const StatusCard(status: "ON WORK"),
                                    DeleteEditButton(
                                        onDelete: () {}, onEdit: () {})
                                  ],
                                )
                              ],
                            ));
                          }),
                ),
          floatingActionButton: CustomFloatingActionButton(onTap: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AddVehicle()))
                .then((value) => data.getDataFromFireStore());
          }),
        );
      }),
    );
  }
}
