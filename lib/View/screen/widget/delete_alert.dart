import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_button.dart';
import 'package:mas_ring_works/constants/app_colors.dart';

class DeleteAlert extends StatelessWidget {
  final void Function() onTap;
  const DeleteAlert({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text(
        "Confirm Delete!",
        style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: AppColors.borderColors),
      ),
      content: Column(
        children: [
          const Text(
            "Are you sure you want to delete this data?",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.secondaryColor),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: CustomButton(
                text: "Cancel",
                onTap: () {
                  Navigator.pop(context);
                },
                color: AppColors.cardColor1,
                textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryColor),
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: CustomButton(text: "Delete", onTap: onTap))
            ],
          )
        ],
      ),
    );
  }
}
