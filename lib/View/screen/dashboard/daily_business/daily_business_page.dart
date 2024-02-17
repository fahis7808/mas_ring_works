import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/dashboard/daily_business/on_daily_card_tap.dart';
import 'package:mas_ring_works/View/widget/circular_progress_indicator.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/provider/daily_business_provider.dart';
import 'package:mas_ring_works/util/snack_bar.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../widget/custom_card.dart';
import '../../widget/delete_edit_buttom.dart';
import '../../widget/status_card.dart';
import '../../widget/title_text_widget.dart';

class DailyBusiness extends StatelessWidget {
  const DailyBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => DailyBusinessProvider(),
      child: Consumer<DailyBusinessProvider>(builder: (context, data, _) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: "Today Work",
          ),
          body: data.isLoading
              ? const CustomCircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: data.taskList.isEmpty
                      ? Center(
                          child: Text(
                            "No Data Found",
                            style: AppFont.title,
                          ),
                        )
                      : ListView.builder(
                          itemCount: data.taskList.length,
                          itemBuilder: (context, index) {
                            final val = data.taskList[index];
                            return InkWell(
                                onTap: () {
                                  if (val.status != "Finished") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => OnDailyCardTap(
                                                  taskModel: val,
                                                ))).then(
                                        (value) => data.getDataFromFireStore());
                                  } else {
                                    showSnackBar(context, "Trip Completed");
                                  }
                                },
                                child: CustomCard(
                                    padding: EdgeInsets.zero,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: const BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  topLeft:
                                                      Radius.circular(20))),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15.0),
                                                  child: Text(
                                                    val.taskName.toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: AppFont.cardTitle,
                                                  ),
                                                ),
                                              ),
                                              StatusCard(
                                                status: val.status == null ||
                                                        val.status == ""
                                                    ? "IDLE"
                                                    : val.status.toString(),
                                                color: AppColors.colorOne,
                                                textStyle: const TextStyle(
                                                    color:
                                                        AppColors.borderColors,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: 270,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TitleTextWidget(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        title: "Vehicle Number",
                                                        text: val.vehicleNumber
                                                            .toString()),
                                                    TitleTextWidget(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        title: "Start Location",
                                                        text: val.location
                                                            .toString()),
                                                    TitleTextWidget(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        title: "Customer",
                                                        text: val.customerName
                                                            .toString()),
                                                    TitleTextWidget(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        title: "Driver Name",
                                                        text: val.driverName
                                                                ?.toString() ??
                                                            ""),
                                                    TitleTextWidget(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        title: "Item Count",
                                                        text: val.unit
                                                            .toString()),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 270,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    TitleTextWidget(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        title: "Item",
                                                        text: val.item
                                                            .toString()),
                                                    TitleTextWidget(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        title: "Site Location",
                                                        text: val.location
                                                            .toString()),
                                                    TitleTextWidget(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        title:
                                                            "Customer Number",
                                                        text: val.customerMobile
                                                            .toString()),
                                                    TitleTextWidget(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        title: "Driver Number",
                                                        text: val.driverMobile
                                                            .toString()),
                                                    SizedBox(
                                                        height: 40,
                                                        child: DeleteEditButton(
                                                            onDelete: () {
                                                            },
                                                            onEdit: () {}))
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )));
                          }),
                ),
        );
      }),
    );
  }
}
