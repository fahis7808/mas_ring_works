import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';


class CustomDropdownField<T extends Object> extends StatelessWidget {
  final String? text;
  final T? value;
  final String? labelText;
  final String? hintText;
  final EdgeInsetsGeometry? padding;
  final List<T> items;
  // final String Function(T value) textConv;
  final void Function(T? value)? onChanged;
  final String? Function(T? value)? validator;
  final bool readOnly;

  const CustomDropdownField(
      {super.key,
        required this.items,
        required this.onChanged,
        this.text,
        required this.value,
        this.padding,
        this.labelText,
        this.hintText, this.validator,  this.readOnly = false,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        text != null
            ? Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(text ?? "", style: AppFont.textFieldLabel),
          ],
        )
            : const SizedBox(),
        const SizedBox(
          height: 8,
        ),
        DropdownButtonFormField<T>(
          isExpanded: true,
          validator: validator,
          icon: const Icon(
            Icons.arrow_drop_down_outlined,
            color: AppColors.primaryColor,
          ),
          value: items.where((element) => element == value).isNotEmpty
              ? value
              : null,
          items:readOnly ? null :  items.isEmpty
              ? null
              : items.toSet().toList().map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(
                e.toString(),
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: onChanged,
          style: AppFont.textFieldText,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppFont.textFieldText,
              label: Text(labelText ?? ""),
              labelStyle: AppFont.textFieldLabel,
              fillColor: AppColors.cardColor,
              filled: true,
              contentPadding: padding ??
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                  borderSide: labelText == null
                      ? BorderSide.none
                      : const BorderSide(
                      width: 1, color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                borderSide: labelText == null
                    ? BorderSide.none
                    : const BorderSide(width: 2, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              )),
        ),
      ],
    );
  }
}
