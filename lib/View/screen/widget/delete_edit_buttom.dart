import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class DeleteEditButton extends StatelessWidget {
  final void Function() onDelete;
  final void Function() onEdit;
  const DeleteEditButton({Key? key, required this.onDelete, required this.onEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      IconButton(onPressed: onDelete, icon: const Icon(Icons.delete,color: AppColors.gray,)),
      IconButton(onPressed: onEdit, icon: const Icon(Icons.edit,color: AppColors.gray,))
    ],);
  }
}
